//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Pablo Ruiz on 8/11/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    // The @StateObject property wrapper is used to create and manage an instance of TransactionListViewModel as a source of truth in this app.
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //injects transactionListVM into the SwiftUI environment, making it available to ContentView and any child views
                .environmentObject(transactionListVM)
        }
    }
}
