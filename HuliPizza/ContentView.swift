//
//  ContentView.swift
//  HuliPizza
//
//  Created by LinkedIn User on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    var menu:[MenuItem]
    
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders:Bool = false
    @State private var showMenu:Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    
    var body: some View {
        VStack {
            
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
            
            StatusBarView(showOrders: $showOrders, showMenu: $showMenu)
                .foregroundStyle(.white)
                .font(.title2)
            if showOrders
            {
                OrderView(orders: orders)
                    .cornerRadius(10)
            }
            else{
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                if showMenu {
                    MenuGridView(menu: menu)
                }else {
                    MenuView(menu:menu, selectedItem: $selectedItem)
                }
                
            }
            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan,Color("Surf"),Color("Sky"),.white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu:MenuModel().menu)
        
    }
}

