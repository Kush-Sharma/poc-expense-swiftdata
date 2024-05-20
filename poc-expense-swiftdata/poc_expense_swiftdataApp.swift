//
//  poc_expense_swiftdataApp.swift
//  poc-expense-swiftdata
//
//  Created by Kush Sharma on 22/04/2024.
//

import SwiftUI
import SwiftData

@main
struct poc_expense_swiftdataApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Expense.self])
        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
