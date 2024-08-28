//
//  ProductEndpoint.swift
//  MVVM
//
//  Created by Sajal Kaushal on 27/08/24.
//

import Foundation

enum ProductEndpoint{
    case getProducts
}

extension ProductEndpoint:Endpoint{
    var path: String { 
        switch self {
        case .getProducts:
            return "/products"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    
}
