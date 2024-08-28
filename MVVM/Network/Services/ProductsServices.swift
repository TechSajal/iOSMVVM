//
//  ProductsServices.swift
//  MVVM
//
//  Created by Sajal Kaushal on 27/08/24.
//

import Foundation

protocol ProductsServices {
    func getProducts(completion: @escaping (Result<[Product],RequestError>) -> Void)
}

struct ProductsService: HTTPClient,ProductsServices{
    
    func getProducts(completion: @escaping (Result<[Product], RequestError>) -> Void) {
        sendRequest(endpoint:ProductEndpoint.getProducts, responseModel:[Product].self, completion: completion)
    }
    
    
}
