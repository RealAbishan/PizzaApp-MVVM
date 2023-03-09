//
//  ContentView.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore

    @Environment(\.colorScheme) var colorScheme

    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        //UITabBar.appearance().unselectedItemTintColor = Color(Color.orange.opacity(0.3))
      }
    var body: some View {
        TabView {
            MainView().tabItem {
                Label("Home", systemImage: "house")
            }
            
            FavouriteView().tabItem {
                Label("Favourites", systemImage: "star")
            }
        }
        .accentColor(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())

    }
}
