//
//  CartButton.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-09.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
//        ZStack(alignment: .topTrailing){
//            Image(systemName: "cart")
        HStack {
            Text("Bag")
                .underline()
            if numberOfProducts>0 {
                Text("\(numberOfProducts)")
            }
        }
            
            
//        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
