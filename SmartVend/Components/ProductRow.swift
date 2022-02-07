//
//  ProductRow.swift
//  SmartVend
//
//  Created by Devin Allen on 2/4/22.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManger: CartManger
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("$\(product.price)")
            }
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor((Color(hue: 1.0, saturation: 0.89, brightness: 0.835)))
                .onTapGesture {
                    cartManger.removeFromCart(product: product)
                    
                }
    }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
}
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[3])
            .environmentObject(CartManger())
    }
}
