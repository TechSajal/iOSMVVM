//
//  ProductsVM.swift
//  MVVM
//
//  Created by Sajal Kaushal on 22/08/24.
//

class ProductsVM {
    var productsList : [Product] = []
    var listUpdated: Constant.Closure.VoidClosure?
    var service = ProductsService()
    func begin(){
        service.getProducts{ result in
            switch result{
            case .success(let response):
                self.productsList.append(contentsOf: response)
                self.listUpdated?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
