import Foundation
import Result

let semaphore = DispatchSemaphore(value: 0)

var messages: Message!
let query = Query(from: Settings.accountName, channel: Settings.targetChannel, keyword: Settings.keyword).build()
SlackAPI.fetchMessages(withQuery: query) { result in
    switch result {
    case .success(let value):
        messages = value
    case .failure(let error):
        print("\(error)")
        exit(1)
    }
    semaphore.signal()
}
semaphore.wait()

let text = "## 今週やったこと\n" + messages.matches
    .map { $0.text.components(separatedBy: "\n") }
    .flatMap { $0 }
    .filter { $0 != "今日やること" }
    .unique
    .joined(separator: "\n")

SlackAPI.postMessage(text: text, atChannelID: Settings.destinationChannelID) {
    semaphore.signal()
}
semaphore.wait()

