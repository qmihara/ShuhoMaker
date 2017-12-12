//
//  Array+Unique.swift
//  ShuhoMakerPackageDescription
//
//  Created by Kyusaku Mihara on 2017/12/01.
//

import Foundation

extension Array where Element : Equatable {
    public var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}
