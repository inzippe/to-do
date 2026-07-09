//
//  Item.swift
//  to do
//
//  Created by Ingrid Zippe on 6/24/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var toDo: String
    
    init(timestamp: Date, toDo: String) {
        self.timestamp = timestamp
        self.toDo = toDo
    }
}

