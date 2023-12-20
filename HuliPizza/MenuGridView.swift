//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by Chux Ugonabo MacBook on 2023-12-19.
//

import SwiftUI

struct MenuGridView: View {
    var menu: [MenuItem]
    
    @State private var favorite: [MenuItem] = [testMenuItem]
    @State var selectedItem: MenuItem = noMenuItem
    
    let columnLayout = Array(repeating: GridItem(), count: 2)
    let rowLayout = Array(repeating: GridItem(), count: 5)
    var body: some View {
       
        VStack {
            HStack {
                LazyVGrid(columns: rowLayout) {
                    ForEach(favorite) { item in
                        FavoriteTileView(menuItem: item)
                            .onTapGesture(count: 1) {
                                selectedItem = item
                                
                            }
                    }
                }
            }
            VStack{
                Text(selectedItem.name)
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(menu) { item in
                            MenuItemTileView(menuItem: item)
                                .onTapGesture(count: 2) {
                                    favorite.append(item)
                                    
                                    selectedItem = item
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
