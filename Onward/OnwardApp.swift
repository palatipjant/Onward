//
//  OnwardApp.swift
//  Onward
//
//  Created by Palatip Jantawong on 26/4/2567 BE.
//

import SwiftUI

@main
struct OnwardApp: App {
    
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
