//
//  WaterIntakeApp.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 27/11/24.
//

import SwiftUI

@main
struct WaterIntakeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DashboardView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
