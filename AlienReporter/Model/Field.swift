//
//  Field.swift
//  AlienReporter
//
//  Created by Daniel Colnaghi on 03/09/2018.
//  Copyright © 2018 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct Field: Codable {
    var id: String
    var caption: String
    var type: FieldType
    enum FieldType: String, Codable {
        case text
        case date
        case number
    }
}
