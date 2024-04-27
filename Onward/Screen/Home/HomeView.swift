//
//  ContentView.swift
//  Onward
//
//  Created by Palatip Jantawong on 26/4/2567 BE.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShowAddSheet = false
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var companyItems: FetchedResults<Company>
    
    var body: some View {
        NavigationStack{
            ScrollView{
                    ForEach(companyItems) { item in
                        VStack {
                            Text(item.companyName ?? "Not Found")
                            Text(item.jobRole ?? "Not Found")
                            Text(item.jobType ?? "Not Found")
                            Text("\(item.applyDate!, style: .date)")
                            Text(item.color ?? "Not Found")
                            Text(item.jobStatus ?? "Not Found")
                        }
                    }
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Text("Home")
                        .font(.system(size: 40, weight: .bold))
                        .bold()
                        .padding(.top, 20)
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        isShowAddSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .font(.title.weight(.black))
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                    })
                    .padding(.top, 20)
                }
            }
            .refreshable {
                
            }
            .scrollIndicators(.hidden)
            .sheet(isPresented: $isShowAddSheet, content: {
                AddItemView(isShowAddSheet: $isShowAddSheet)
                    .presentationDetents([.height(500), .height(520)])
                    .presentationCornerRadius(24)
            })
        }
    }
}

#Preview {
    HomeView()
}
