//
//  PizzaApp_MVVMApp.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import SwiftUI

@main
struct PizzaApp_MVVMApp: App {
    
    @StateObject var dataStore = DataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataStore)
        }
    }
}
