//
//  ProductCard.swift
//  SmartVend
//
//  Created by Devin Allen on 2/3/22.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManger: CartManger
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
        ZStack(alignment: .bottom) {
            Image(product.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 180)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .bold()
                
                Text("$\(product.price)")
                    .font(.caption)
                    .bold()
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            
        }
        .frame(width: 150, height: 225)
        .shadow(radius: 5)
            
            Button {
                cartManger.addToCart(product: product)
                
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding(0)
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[4])
            .environmentObject(CartManger())
    }
}
