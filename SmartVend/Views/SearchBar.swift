//
//  SearchBar.swift
//  SmartVend
//
//  Created by Devin Allen on 2/9/22.
//

import SwiftUI

import UIKit

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Text("Search for \(searchText)")
                .searchable(text: $searchText)
            .padding()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
