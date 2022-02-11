//
//  CartView.swift
//  SmartVend
//
//  Created by Devin Allen on 2/4/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManger: CartManger
    var body: some View {
        ScrollView {
            
            if cartManger.paymentSuccess {
                Text(" Thank you")
                        .padding()
            }
            if cartManger.products.count > 0 {
                ForEach(cartManger.products, id: \.id) {
                    product in
                    ProductRow(product: product)
                }
                HStack {
                    Text("Your cart total")
                        Spacer()
                    Text("$\(cartManger.total).00")
                        .bold()
                    
            }
                .padding()
                
                PaymentButton(action: cartManger.pay)
                    .padding()
            } else {
            Text("Your cart is empty")
                
    }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        .onDisappear {
            if cartManger.paymentSuccess {
                cartManger.paymentSuccess = false
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManger())
    }
}
