//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by Chux Ugonabo MacBook on 2023-12-19.
//

import SwiftUI

struct MenuGridView: View {
    var menu: [MenuItem]
    
    @State private var favorite: [Int] = [-1]
    @State var selectedItem: MenuItem = noMenuItem
    
    func menu(id: Int) -> MenuItem {
        menu.first(where: { $0.id ==  id }) ?? noMenuItem
    }
    
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let rowLayout = Array(repeating: GridItem(), count: 5)
    var body: some View {
        
        VStack {
            HStack {
                LazyVGrid(columns: rowLayout) {
                    ForEach(favorite.sorted(), id: \.self) { item in
                        FavoriteTileView(menuItem: menu(id: item))
                            .onTapGesture(count: 2) {
                                if let index  = favorite.firstIndex(where: { $0 == item
                                }) {
                                    favorite.remove(at: index)
                                }
                            }
                        
                    }
                }
            }
            VStack{
                Text(selectedItem.name)
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(menu) { item in
                            if !favorite.contains(item.id) {
                                MenuItemTileView(menuItem: item)
                                    .onTapGesture(count: 2) {
                                        if !favorite.contains(item.id) {
                                            favorite.append(item.id)
                                        }
                                    }
                                    .onLongPressGesture {
                                        
                                    }
                            }
                        }
                    }
                }.padding()
            }
        }
        
        
    }
}

struct MenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridView(menu: MenuModel().menu)
    }
}
