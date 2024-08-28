//
//  Product.swift
//  MVVM
//
//  Created by Sajal Kaushal on 22/08/24.
//

import Foundation

struct Product:Codable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating:Codable {
    let rate: Float
    let count: Int
}
