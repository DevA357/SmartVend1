//
//  ContentView.swift
//  SmartVend
//
//  Created by Devin Allen on 2/2/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var searchText = ""
    
    
    
    @StateObject var cartManger = CartManger()
    var columns = [GridItem(.adaptive(minimum: 90), spacing: 20)]
                            
    var body: some View {
        NavigationView {
           // ZStack {
              //  LinearGradient(colors: [Color("color1"), Color("color")], startPoint: .bottom,
                 //   endPoint: .topLeading)
                  //  .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    TextField("Search Item", text: $searchText)
                        .padding(.leading, 24)
                    }
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .overlay(
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .padding()
                                    .foregroundColor(.gray)
                                Spacer()
                                
                                Button(action: { searchText = "" }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.horizontal, 25)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                })
                            })
                        
                LazyVGrid(columns: columns,  spacing: 5) {
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

//}
