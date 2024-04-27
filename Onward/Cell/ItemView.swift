//
//  ItemView.swift
//  Onward
//
//  Created by Palatip Jantawong on 27/4/2567 BE.
//

import SwiftUI

struct ItemView: View {
    
//    var item: Company
    
    var body: some View {
        VStack{
            HStack{
                Text("Company Name")
                    .font(.title2.weight(.semibold))
                    .frame(height: 35)
                Spacer()
                Text("Accept")
                    .fontWeight(.bold)
                    .frame(height: 35)
            }.padding()
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding()
    }
}

#Preview {
    ItemView()
}
