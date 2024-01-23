//
//  MenuView2.swift
//  HuliPizza
//
//  Created by Chux Ugonabo MacBook on 2024-01-22.
//

import SwiftUI

struct MenuView2: View {
    var menu: [MenuItem]
    @State private var selectedItem: MenuItem? = nil
    
    var body: some View {
        NavigationSplitView{
            List(menu, selection: $selectedItem) { menuItem in
                NavigationLink(value:menuItem) {
                    MenuRowView(item: menuItem )
                }
            }
        } detail: {
            MenuDetailView(item: $selectedItem)
        }
    }
}

struct MenuView2_Previews: PreviewProvider {
    static var previews: some View {
        MenuView2(menu: MenuModel().menu)
    }
}
