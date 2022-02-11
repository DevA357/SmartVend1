//
//  ContentView.swift
//  SmartVend
//
//  Created by Devin Allen on 2/2/22.
//

import SwiftUI


struct ContentView: View {
    
    
    @StateObject var cartManger = CartManger()
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 25)]
    
                            
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { Product in
                        ProductCard(product: Product)
                            .environmentObject(cartManger)
                    }
                    
                }
                .padding()
            }
            .navigationTitle(Text("Item Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManger)
                } label: {
                    CartButton(numberofProducts:
                                cartManger.products.count)
            
                
                }
                
            
                
                }
            
            }
        .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
