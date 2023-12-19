//
//  OrderItemView.swift
//  HuliPizza
//
//  Created by Chux Ugonabo MacBook on 2023-12-19.
//

import SwiftUI

struct OrderItemView: View {
    
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngreient = false
    @State private var pizzaCrust: PizzaCrust = .calzone
    
    var body: some View {
        VStack{
            Toggle(isOn: $doubleIngreient) {
                Text("Double Ingredients " + (doubleIngreient ? "Yes" : "No"))
                Stepper(value: $quantity, in : 1...10) {
                    Text("\(quantity) " + (quantity == 1 ? "pizza" : "pizzas"))
                }
                Picker(selection: $pizzaCrust) {
                    ForEach(PizzaCrust.allCases, id:\.self) { crust in
                        Text(crust.rawValue).tag(crust)
                    }
                } label: {
                    Text("Pizza Crust")
                }
                .pickerStyle(MenuPickerStyle())

            }
        }
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
