//
//  SlackAPI.swift
//  ShuhoMakerPackageDescription
//
//  Created by Kyusaku Mihara on 2017/12/01.
//

import Foundation
import Result

struct SlackAPI {
    static func fetchMessages(withQuery query: String, completion: @escaping ((Result<Message, ShuhoMakerError>) -> Void)) {
        var urlComponents = URLComponents(string: "https://slack.com/api/search.messages")
        urlComponents?.queryItems = [
            URLQueryItem(name: "token", value: Settings.slackAPIToken),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "sort_dir", value: "asc"),
        ]
        guard let url = urlComponents?.url else {
            print("Could not create url. components:\(String(describing: urlComponents))")
            completion(.failure(.unknown))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("An error occured. \(error.localizedDescription)")
                completion(.failure(.httpError))
                return
            }

            guard let data = data else {
                print("JSON deserialize failed.")
                completion(.failure(.jsonError))
                return
            }

            guard let responseValue = try? JSONDecoder().decode(Response.self, from: data) else {
                print("JSON decode failed.")
                completion(.failure(.jsonError))
                return
            }

            completion(.success(responseValue.messages))
        }
        task.resume()
    }

    static func postMessage(text: String, atChannelID channelID: String, completion: @escaping (() -> Void)) {
        var urlComponents = URLComponents(string: "https://slack.com/api/chat.postMessage")
        urlComponents?.queryItems = [
            URLQueryItem(name: "token", value: Settings.slackAPIToken),
            URLQueryItem(name: "channel", value: channelID),
            URLQueryItem(name: "text", value: text),
            URLQueryItem(name: "as_user", value: "false"),
        ]
        guard let url = urlComponents?.url else {
            completion()
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Post a message failed. \(error.localizedDescription)")
            }
            completion()
        }
        task.resume()
    }
}
