//
//  APIManager.swift
//  MVVM
//
//  Created by Sajal Kaushal on 22/08/24.
//

import UIKit

enum DataError:Error{
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

// Used to shorten Lost string or naming
typealias Handle = (Result<[Product],DataError>) -> Void

// final -> Stop Inheritance
final class APIManager{
    
    static let stared = APIManager()
    
    // Singleton
    private  init(){}
    
    func fetchProducts(completion: @escaping Handle){
        
        guard let url = URL(string: Constant.Api.productUrl) else {
           completion(.failure(.invalidURL))
           return
        }
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            guard let data ,error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                // JsonDecoder -> Data ko model mai convert karegha
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.network(error)))
            }
        }.resume()
    }
    
}
