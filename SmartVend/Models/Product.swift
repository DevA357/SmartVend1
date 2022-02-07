//
//  SnackList.swift
//  SmartVend
//
//  Created by Devin Allen on 2/2/22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Skittles", image: "skittles", price: Int(1.00)),
                   Product(name: "Sour Patch Kids", image: "sourpatch", price: Int(1.00)),
                   Product(name: "Crunch", image: "crunchbar", price: Int(1.00)),
                   Product(name: "Hershey", image: "hershersbar", price: Int(1.00)),
                  Product(name: "Doritos", image: "Chip1", price: Int(1.00)),
                  Product(name: "Lays Classic", image: "Chip2", price: Int(1.00)),
                  Product(name: "Chettos Puff", image: "Chip4", price: Int(1.00)),
                  Product(name: "Lays Salt and vinegar", image: "layssalt", price: Int(1.00)),
                  Product(name: "Lays BBQ", image: "Chip6", price: Int(1.00)),
                  Product(name: "Doritos cool ranch", image: "Chip7", price: Int(1.00)),
                  Product(name: "Minute Maid Lemonade", image: "Drink1", price: Int(1.05)),
                  Product(name: "Snapple fruit punch", image: "Drink2", price: Int(1.05)),
                   Product(name: "Swedish fish", image: "fish1", price: Int(1.00)),
                  Product(name: "Hot Chettos", image: "hotchip", price: Int(1.00)),
                  Product(name: "coca-Cola classic", image: "pop", price: Int(1.00)),
                  Product(name: "Dr Pepper", image: "pop1", price: Int(1.00)),
                  Product(name: "Fanta Orange", image: "pop2", price: Int(1.00)),
                  Product(name: "Canada Dry", image: "pop3", price: Int(1.00)),
                   Product(name: "Rold Gold original pretzels", image: "pretzels", price: Int(1.00)),
                  Product(name: "Red Bull", image: "redbull", price: Int(2.50)),
                  Product(name: "Smart Water", image: "water", price: Int(1.50)),
                  
]
