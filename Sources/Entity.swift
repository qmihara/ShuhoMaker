//
//  Entity.swift
//  ShuhoMakerPackageDescription
//
//  Created by Kyusaku Mihara on 2017/12/01.
//

import Foundation

struct Response: Codable {
    var messages: Message
}

struct Message: Codable {
    var matches: [Match]
}

struct Match: Codable {
    var text: String
}

