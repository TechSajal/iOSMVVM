//
//  HTTPClient.swift
//  MVVM
//
//  Created by Sajal Kaushal on 27/08/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type, completion: @escaping (Result<T, RequestError>) -> Void)
}

extension HTTPClient {
  
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type,
        completion: @escaping (Result<T, RequestError>) -> Void
    ){
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else{
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        if let body = endpoint.body{
            if endpoint.method == .get {
                request.addQueryParameters(body)
            }
        }
        
        URLSession.shared.dataTask(with: request){ data,response,error in
            
            guard let data ,error == nil else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    completion(.failure(.decode))
                    return
                }
                print("recentCallList success")
                return completion(.success(decodedResponse))
            case 401:
                print("recentCallList 401")
                completion(.failure(.unauthorized))
            default:
                print("recentCallList default")
                completion(.failure(.unexpectedStatusCode))
            }
            
        }.resume()
    }
}

extension URLRequest {
    mutating func addQueryParameters(_ parameters: [String: Any]) {
        guard let url = self.url else { return }

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)

        var queryItems: [URLQueryItem] = urlComponents?.queryItems ?? []
        for (key, value) in parameters {
            let stringValue = "\(value)"
            let queryItem = URLQueryItem(name: key, value: stringValue)
            queryItems.append(queryItem)
        }

        urlComponents?.queryItems = queryItems
        self.url = urlComponents?.url
    }
}
