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
    @State var pizzaCrust: PizzaCrust
    @State private var name: String = ""
    @State private var comment: String = ""
    
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: $doubleIngreient) {
                Text("Double Ingredients " + (doubleIngreient ? "Yes" : "No"))
            }
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
            
            VStack {
                Text("comments")
                TextEditor(text: $comment)
            }
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(radius: 1)
            
            Spacer()

        }
        .padding(15)
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
