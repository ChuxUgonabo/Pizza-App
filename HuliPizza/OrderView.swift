//
//  OrderView.swift
//  HuliPizza
//
//  Created by LinkedIn User on 11/14/22.
//

import SwiftUI


struct OrderView: View {
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
                NavigationStack {
                    List($orders.orderItems){ $order in
                        //Text(order.item.name)
                        NavigationLink(value:order) {
                        
                            OrderRowView(order: $order)
                                .padding(4)
                                .background(.regularMaterial,in:RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding(.bottom, 5)
                                .padding([.leading,.trailing],7)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your Order")
                    }
                    
                }
                .padding(.top,70)

            Button("Delete Order"){
                if !orders.orderItems.isEmpty{orders.removeLast()}
            }
            .padding(5)
            .background(.regularMaterial,in:Capsule())
            .padding(7)
        }
        .background(.regularMaterial)
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
