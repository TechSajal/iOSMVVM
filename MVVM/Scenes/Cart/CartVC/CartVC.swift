//
//  CartVC.swift
//  MVVM
//
//  Created by Sajal Kaushal on 27/08/24.
//

import UIKit

class CartVC: UIViewController {

    @IBAction func goToHomeScreen(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
