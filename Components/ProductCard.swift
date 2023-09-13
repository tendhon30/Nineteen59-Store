//
//  ProductCard.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-09.
//

import SwiftUI


struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favManager: FavManager
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack (alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(30)
                    .frame(width:180)
                    .scaledToFit()
                
                VStack(alignment: .leading){
                    Text(product.name)
                        .bold()
                    
                    Text("$\(product.price)")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius:3)
            
            HStack {
                
                Button {
                        favManager.addToFav(product: product)
                    
                } label: {
                    Image(systemName: "heart")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding(.trailing, 75.0)
                        .padding(.top, 10.0)
                }
                
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding([.top, .trailing], 10.0)
                }
                
            }
            
            
            
            
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
            .environmentObject(FavManager())
    }
}
