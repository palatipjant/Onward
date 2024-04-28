//
//  ItemView.swift
//  Onward
//
//  Created by Palatip Jantawong on 27/4/2567 BE.
//

import SwiftUI

struct ItemView: View {
    
    var item: Company
    
    var body: some View {
        VStack(spacing: 0){
            HStack(alignment: .bottom){
                Text(item.companyName ?? "Nor Found")
                    .font(.title.weight(.bold))
                    .frame(height: 35)
                Spacer()
                Text(item.jobStatus ?? "Not Found")
                    .padding(.top, 4)
                    .fontWeight(.black)
                    .frame(height: 30)
            }.padding(.horizontal)
            HStack{
                Text(item.jobRole ?? "Not Found")
                    .frame(height: 35)
                Spacer()
            }.padding(.leading)
            HStack{
                Text(item.jobType ?? "Not Found")
                    .font(.subheadline)
                    .frame(height: 35)
                Spacer()
                Text("\(item.applyDate!, style: .date)")
                    .font(.subheadline)
                    .frame(height: 35)
            }.padding(.horizontal)
            
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Color("\(item.color ?? "Gray")_add"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        .padding(.top)
    }
}

//#Preview {
//    ItemView()
//}
