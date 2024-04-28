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
            ZStack {
                ScrollView {
                    ForEach(companyItems) { item in
                        ItemView(item: item)
                            .onTapGesture {
                                
                            }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isShowAddSheet.toggle()
                        }, label: {
                            Circle()
                                .frame(width: 70, height: 70)
                                .overlay {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .foregroundStyle(.white)
                                        .font(.title.weight(.black))
                                        .frame(width: 30, height: 30)
                                        .aspectRatio(contentMode: .fit)
                                }
                                .padding(.trailing, 30)
                        })
                        .padding(.top, 20)
                    }
                }
            }
            .navigationTitle("Onward")
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
    private func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let item = companyItems[index]
            viewContext.delete(item)
        }
        try? viewContext.save()
    }
}

#Preview {
    HomeView()
}
