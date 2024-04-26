//
//  ContentView.swift
//  Onward
//
//  Created by Palatip Jantawong on 26/4/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAddSheet = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .imageScale(.large)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Home")
                        .font(.title)
                        .bold()
                }
            })
            .toolbarTitleDisplayMode(.large)
            .ignoresSafeArea(edges: .top)
            .scrollIndicators(.hidden)
            .sheet(isPresented: $showAddSheet, content: {
                VStack{
                    Text("fee")
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
