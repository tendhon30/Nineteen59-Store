//
//  Product.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-09.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Silent Genocide", image: "shirt1", price: 30),
                Product(name: "Kaws Outline", image: "shirt2", price: 30),
                Product(name: "Nineteen59 Tee", image: "shirt3", price: 30),
                   Product(name: "Fundraiser Line", image: "shirt4", price: 35),
                   Product(name: "1959 X PUREV", image: "shirt5", price: 35),
                   Product(name: "NationWillRise", image: "shirt6", price: 30),
                   Product(name: "SS2 NWR Hoodie", image: "sweater1", price: 40),
                   Product(name: "Quarter Zip Up", image: "sweater2", price: 45),
                   Product(name: "ESI Crewneck", image: "sweater3", price: 35),
                   Product(name: "SS4 Quarter Zip", image: "sweater4", price: 60),
                   Product(name: "SS1 Quarter Zup", image: "sweater5", price: 45)]


