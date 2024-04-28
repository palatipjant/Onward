//
//  AddItemView.swift
//  Onward
//
//  Created by Palatip Jantawong on 27/4/2567 BE.
//

import SwiftUI

struct AddItemView: View {
    
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var companyItems: FetchedResults<Company>
    
    @Environment(\.dismiss) var dismiss
    @Binding var isShowAddSheet: Bool
    
    @ObservedObject var viewModel = AddItemViewModel()
    
    let JobType = ["Full-Time", "Part-Time", "Intern"]
    let Status = ["Select", "Applied", "Review", "Interview", "Accept", "Reject"]
    let colorName = ["Red", "Blue", "Purple", "Gray", "Pink", "Yellow"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            HStack {
                TextField("Company Name", text: $viewModel.itemCompanyTitle)
                    .frame(height: 50)
                    .background(.white)
                    .font(.title.weight(.bold))
                    .autocorrectionDisabled(true)
                Spacer()
                Button(action: {
                    dismiss()
                    viewModel.itemCompanyTitle = ""
                    viewModel.itemJobType = "Type"
                    viewModel.itemStatus = "Select"
                    viewModel.itemAppliedDate = Date()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .font(.title.weight(.bold))
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                })
            }
            
            TextField("Role", text: $viewModel.itemRole)
                .frame(height: 35)
                .background(.white)
                .font(.title3.weight(.medium))
                .autocorrectionDisabled(true)
            
            Picker("Job Type", selection: $viewModel.itemJobType) {
                ForEach(JobType, id: \.self) { type in
                    Text(type).tag(type)
                }
            }
            .pickerStyle(.segmented)
            DatePicker("Applied Date", selection: $viewModel.itemAppliedDate, displayedComponents: .date)
                .datePickerStyle(.automatic)
                .foregroundStyle(.gray)
            HStack {
                Text("Status")
                    .foregroundStyle(.gray)
                Spacer()
                Picker("Status", selection: $viewModel.itemStatus) {
                    ForEach(Status, id: \.self) { status in
                        Text(status).tag(status)
                    }
                }
                .pickerStyle(.menu)
            }
            
            HStack {
                Text("Color")
                    .foregroundStyle(.gray)
                Spacer()
                Picker("Color", selection: $viewModel.itemColor) {
                    ForEach(colorName, id: \.self) { color in
                        Text(color).tag(color)
                    }
                }
                .pickerStyle(.menu)
            }
            
            Button(action: {
                addItem()
                dismiss()
                viewModel.itemCompanyTitle = ""
                viewModel.itemJobType = "Type"
                viewModel.itemStatus = "Select"
                viewModel.itemAppliedDate = Date()
            }, label: {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 50)
                    .overlay {
                        HStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .font(.title.weight(.light))
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.white)
                            Text("Save")
                                .font(.title3.weight(.semibold))
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.top, 15)
            })
            Spacer()
        }
        .padding()
        .padding(.top,20)
    }
    private func addItem() {
        let newCompanyItem = Company(context: viewContext)
        newCompanyItem.id = UUID()
        newCompanyItem.companyName = viewModel.itemCompanyTitle
        newCompanyItem.jobRole = viewModel.itemRole
        newCompanyItem.jobType = viewModel.itemJobType
        newCompanyItem.applyDate = viewModel.itemAppliedDate
        newCompanyItem.jobStatus = viewModel.itemStatus
        newCompanyItem.color = viewModel.itemColor
        try? viewContext.save()
    }
}

//#Preview {
//    AddItemView(isShowAddSheet: .constant(true))
//}
