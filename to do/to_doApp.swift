//
//  to_doApp.swift
//  to do
//
//  Created by Ingrid Zippe on 6/24/26.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Tell SwiftData to manage the database container for your models
        .modelContainer(for: TodoItem.self)
    }
}

//@main
//struct to_doApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}
