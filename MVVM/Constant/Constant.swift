//
//  Constant.swift
//  MVVM
//
//  Created by Sajal Kaushal on 22/08/24.
//

enum Constant {
    enum Api{
        static let productUrl = "https://fakestoreapi.com/products"
    }
    
    enum Closure{
        typealias VoidClosure = (() -> Void)
        typealias BoolClosure = ((Bool) -> Void)
        typealias IntClosure = ((Int) -> Void)
    }
}
