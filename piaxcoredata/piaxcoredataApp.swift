//
//  piaxcoredataApp.swift
//  piaxcoredata
//
//  Created by Bill Martensson on 2021-11-15.
//

import SwiftUI

@main
struct piaxcoredataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
