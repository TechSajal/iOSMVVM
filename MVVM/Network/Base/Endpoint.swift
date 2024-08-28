//
//  Endpoint.swift
//  MVVM
//
//  Created by Sajal Kaushal on 27/08/24.
//

protocol Endpoint{
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var body: [String: Any]? { get }

}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "fakestoreapi.com"
    }
}
