//
//  Error.swift
//  ShuhoMakerPackageDescription
//
//  Created by Kyusaku Mihara on 2017/12/01.
//

import Foundation

enum ShuhoMakerError: Error {
    case httpError
    case jsonError
    case unknown
}
