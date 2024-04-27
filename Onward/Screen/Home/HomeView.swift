//
//  ContentView.swift
//  Onward
//
//  Created by Palatip Jantawong on 26/4/2567 BE.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShowAddSheet = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
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
