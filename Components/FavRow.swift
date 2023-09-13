//
//  FavRow.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-12.
//

import SwiftUI

struct FavRow: View {
    @EnvironmentObject var favManager: FavManager
    @EnvironmentObject var cartManager: CartManager
    
    var product: Product
    
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing:10){
                Text(product.name)
                    .bold()
                
                Text("$\(product.price)")
            }
            
            Spacer()
            
            Image(systemName: "heart.slash")
                .foregroundColor(.red)
                .onTapGesture {
                    favManager.removeFromFav(product: product)
                }
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "cart.fill.badge.plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    }


struct FavRow_Previews: PreviewProvider {
    static var previews: some View {
        FavRow(product: productList[1])
            .environmentObject(FavManager())
            .environmentObject(CartManager())
    }
}
