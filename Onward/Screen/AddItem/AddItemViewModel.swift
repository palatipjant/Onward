//
//  AddItemViewModel.swift
//  Onward
//
//  Created by Palatip Jantawong on 27/4/2567 BE.
//

import Foundation

class AddItemViewModel: ObservableObject {
    
    @Published var itemCompanyTitle = ""
    @Published var itemRole = ""
    @Published var itemJobType = "Type"
    @Published var itemStatus = "Select"
    @Published var itemAppliedDate = Date()
    @Published var itemColor = "Red"
    
    func tapItem(item: Company) {
        itemCompanyTitle = item.companyName!
        itemRole = item.jobRole!
        itemJobType = item.jobType!
        itemStatus = item.jobStatus!
        itemAppliedDate = item.applyDate!
        itemColor = item.color!
    }
}
