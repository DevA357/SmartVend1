//
//  HelpButton.swift
//  SmartVend
//
//  Created by Devin Allen on 2/11/22.
//

import SwiftUI

struct HelpButton: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: "gear")
            .padding(.top, 5)
    }
}

struct HelpButton_Previews: PreviewProvider {
    static var previews: some View {
        HelpButton()
    }
}
}
