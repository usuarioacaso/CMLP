//
//  InicioViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol InicioViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class InicioViewController: UIViewController {
    
     weak var delegate:InicioViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
    
}
