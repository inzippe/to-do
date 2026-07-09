//
//  TodoItem.swift
//  to do
//
//  Created by Ingrid Zippe on 6/25/26.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    
    init(title: String, isCompleted: Bool = false, createdAt: Date = .now) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
