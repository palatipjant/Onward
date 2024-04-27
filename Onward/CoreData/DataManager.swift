//
//  DataController.swift
//  Onward
//
//  Created by Palatip Jantawong on 27/4/2567 BE.
//

import Foundation
import CoreData

class DataManager: NSObject, ObservableObject {
    /// Dynamic properties that the UI will react to
    @Published var companyItems: [Company] = [Company]()
    
    /// Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "Company")
    
    /// Default init method. Load the Core Data container
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}

