//
//  Reminders_SwiftDataApp.swift
//  Reminders-SwiftData
//
//  Created by DJC on 9/25/24.
//

import SwiftUI

@main
struct RemindersCloneApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsScreen()
            }.modelContainer(for: MyList.self)
        }
    }
}
