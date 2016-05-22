//
//  PageItemController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 12/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    //MARK: Variables
    
    var pageIndex = 0
    var topText = "top place marker"
    var bottomText = "bottom place marker"
    var color = UIColor.redColor()
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = imagen {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topLabel.text = topText
        imagen.image = UIImage(named: imageName)
        bottomLabel.text = bottomText
        bottomLabel.backgroundColor = color
    }
}
