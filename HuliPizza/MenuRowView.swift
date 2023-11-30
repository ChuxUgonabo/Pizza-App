//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by LinkedIn User on 11/14/22.
//

import SwiftUI

struct MenuRowView: View {
    var item:MenuItem
    var body: some View {
        HStack(alignment:.top,spacing:15) {
            if let image = UIImage(named: "\(item.id)_sm"){
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
                    .padding(.leading,-15)
            } else {
                Image("surfboard_sm")
            }
            VStack(alignment:.leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price,format: .currency(code: "USD"))
                }
                RatingsView(rating: item.rating)
            }
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(item: testMenuItem)
    }
}
