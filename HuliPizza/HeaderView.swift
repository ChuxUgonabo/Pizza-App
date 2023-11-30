//
//  HeaderView.swift
//  HuliPizza
//
//  Created by LinkedIn User on 11/14/22.
//

import SwiftUI
struct HeaderView: View {
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            Image("surfBanner")
                .resizable()
                .scaledToFit()
//                .scaledToFill()
                .ignoresSafeArea()
            Text("Huli Pizza Company")
                .font(.custom("Georgia", size: 30, relativeTo: .title))
//                .foregroundColor(Color("Sky"))
                .foregroundStyle(.regularMaterial)
                .fontWeight(.semibold)
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
