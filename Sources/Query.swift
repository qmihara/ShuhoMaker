//
//  Query.swift
//  ShuhoMakerPackageDescription
//
//  Created by Kyusaku Mihara on 2017/12/01.
//

import Foundation

struct Query {
    var from: String
    var channel: String
    var keyword: String

    func build() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents([.year, .month, .weekOfMonth], from: Date())

        let fromDate: Date = {
            var tmp = dateComponents
            tmp.weekday = 2
            return calendar.date(from: tmp)!
        }()
        let toDate = Date(timeInterval: 60*60*24*7, since: fromDate)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return "from:\(from) after:\(dateFormatter.string(from: fromDate)) before:\(dateFormatter.string(from: toDate)) in:\(channel) \(keyword)"
    }
}
