//
//  CartManger.swift
//  SmartVend
//
//  Created by Devin Allen on 2/4/22.
//

import Foundation

class CartManger: ObservableObject {
    @Published private(set) var products : [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
        
        
    }
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
