//
//  MainViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import MMDrawerController

class MainViewController: MMDrawerController {
    
    private let rowInicio = 0
    private let rowInfo = 1
    private let rowRelac = 2
    private let rowLugar = 3
    private let rowImagenes = 4
    private let rowUbicacion = 5

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // asigna el viewController del centro
        if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navInicioViewController") as? UINavigationController {
            centerViewController = navigationController
            if let viewController = navigationController.topViewController as? InicioViewController {
                viewController.delegate = self
            }
        }
        
        // agregar al menu al left
        if let menuViewController = storyboard?.instantiateViewControllerWithIdentifier("menuViewController") as? ViewController {
            leftDrawerViewController = menuViewController
            menuViewController.delegate = self
        }
    }
}

extension MainViewController:InicioViewControllerDelegate, InfoViewControllerDelegate, RelacViewControllerDelegate, LugarViewControllerDelegate, ImagenesViewControllerDelegate, UbicacionViewControllerDelegate {
    func openCloseMenu() {
        if openSide == MMDrawerSide.Left {
            closeDrawerAnimated(true, completion: { (finished) -> Void in
            })
        }else{
            openDrawerSide(MMDrawerSide.Left, animated: true, completion: {(finished) -> Void in
            })
        }
    }
}

    // MARK:- Extension

extension MainViewController:ViewControllerDelegate {
    func selectedIndexPath(indexPath:NSIndexPath) {
        
        switch indexPath.row {
            
        case rowInicio:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navInicioViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? InicioViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowInfo:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navInfoViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? InfoViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowRelac:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navRelacViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? RelacViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowLugar:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navLugarViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? LugarViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowImagenes:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navImagenesViewController") as? UINavigationController {
                centerViewController = navigationController
                if let viewController = navigationController.topViewController as? ImagenesViewController {
                    viewController.delegate = self
                }
            }
            break
            
        case rowUbicacion:
            if let navigationController = storyboard?.instantiateViewControllerWithIdentifier("navUbicacionViewController") as? UINavigationController {
                centerViewController = navigationController
                if let ViewController = navigationController.topViewController as? UbicacionViewController {
                    ViewController.delegate = self
                }
            }
            break
            
        default:
            break
        }
        openCloseMenu()
    }
}
