//
//  StatusBarView.swift
//  HuliPizza
//
//  Created by Chux Ugonabo MacBook on 2023-12-01.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var orders: OrderModel
    @Binding var showOrders: Bool
    @Binding var showMenu: Bool
//    @EnvironmentObject var orderManager: OrderManager
 
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            
            Button {
                showOrders.toggle()
            } label:{
                Image(systemName: showOrders ? "cart" : "menucard")
            }
            
            if !showOrders {
                Button {
                    showMenu.toggle()
                } label:{
                    Image(systemName: showMenu ? "square.grid.3x2" : "list.bullet")
                }
            }
            
            Spacer()
            Label{
                Text(orders.orderTotal,format: .currency(code: "USD"))
            }icon:{
            Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }
        }
        .padding(10)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(showOrders: .constant(false), showMenu: .constant(false)).environmentObject(OrderModel())
    }
}
