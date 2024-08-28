//
//  ProductsVC.swift
//  MVVM
//
//  Created by Sajal Kaushal on 22/08/24.
//

import UIKit

class ProductsVC: UIViewController {
    
   
    @IBOutlet weak var productTableView: UITableView!
    
    
    let viewModel = ProductsVM()
    
    @IBAction func goToCart(_ sender: UIButton) {
        self.navigationController?.pushViewController(CartVC(), animated: false)
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        setupViewModel()
        self.viewModel.begin()
        
        
    }
}

extension ProductsVC {
    
    private func setupUI(){
        productTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
        
    }
    
    private func setupConstraint(){
        
        
    }
    
    private func setupViewModel(){
        self.viewModel.listUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.productTableView.reloadData()
            }
        }
    }
    
}

extension ProductsVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.productsList[indexPath.row]
        cell.productLabel.text = product.title
        cell.productSubLabel.text = product.category
        cell.productRating.setTitle("\(product.rating.rate)", for: .normal)
        cell.productDescription.text = product.description
        cell.productPrice.text = "\(product.price)"
        cell.productImage.setImage(with: product.image)
        return cell
    }
    
    
}

