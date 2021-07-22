//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Sergio Sepulveda on 2021-07-21.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
