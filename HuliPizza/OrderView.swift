//
//  OrderView.swift
//  HuliPizza
//
//  Created by LinkedIn User on 11/14/22.
//

import SwiftUI


struct OrderView: View {
    @Binding var orders:[OrderItem]
    var body: some View {
        VStack {
            ZStack(alignment:.top){
                
                
                ScrollView{
                    ForEach($orders){ order in
                        //Text(order.item.name)
                        OrderRowView(order: order)
                            .padding(4)
                            .background(.regularMaterial,in:RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding(.bottom, 5)
                            .padding([.leading,.trailing],7)
                    }
                    
                }
                .padding(.top,70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()
                    Label{
                        Text(59.99,format: .currency(code: "USD"))
                    }
                icon:{
                    Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
                    
                }
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .padding()
            Button("Delete Order"){
                if !orders.isEmpty{orders.removeLast()}
            }
            .padding(5)
            .background(.regularMaterial,in:Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: .constant(testOrders))
    }
}
