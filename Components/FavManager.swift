//
//  FavManager.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-12.
//

import Foundation
class FavManager: ObservableObject{
    @Published private(set) var products: [Product] = []
    
    func addToFav(product: Product){
        products.append(product)
    }
    
    func removeFromFav(product: Product){
        products = products.filter {$0.id != product.id}
        
    }
    
}
