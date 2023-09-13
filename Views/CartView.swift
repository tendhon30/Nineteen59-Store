//
//  CartView.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-09.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count>0{
                ForEach(cartManager.products, id: \.id){
                    product in
                    ProductRow(product: product)
                }
                
                HStack{
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
//                PaymentButton(action: {})
//                    .padding()
            }else {
                Text("Your shopping bag is empty.")
            }
       
        }
        .navigationTitle((Text("Shopping Bag")))
        .padding()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
