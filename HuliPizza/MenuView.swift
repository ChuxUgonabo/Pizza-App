//
//  MenuView.swift
//  HuliPizza
//
//  Created by LinkedIn User on 11/14/22.
//

import SwiftUI

struct MenuView: View {
    var menu:[MenuItem]
    @Binding var selectedItem: MenuItem
    var body: some View {
        List(MenuCategory.allCases, id: \.self){ category in
            Section {
                ForEach(menu.filter({$0.category == category})){ item in
                    MenuRowView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menu:MenuModel().menu, selectedItem: .constant(testMenuItem))
    }
}
