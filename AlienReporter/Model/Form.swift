//
//  Form.swift
//  AlienReporter
//
//  Created by Daniel Colnaghi on 03/09/2018.
//  Copyright © 2018 Daniel Colnaghi. All rights reserved.
//

import Foundation

struct Form: Codable {
    var userId: Int
    var formId: String
    var fields: [Field]
    var lastChangedDate: String
    var lastChangedBy: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case formId
        case fields = "form"
        case lastChangedDate
        case lastChangedBy
    }
}
