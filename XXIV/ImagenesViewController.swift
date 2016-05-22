//
//  ImagenesViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol ImagenesViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class ImagenesViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController = UIPageViewController() // esta linea crea el view controller
    
    let pageTitles = ["Monitores","Sexta Seccion","Decima Seccion","En el comedor","En el campo de batalla"]
    let imagen = ["monitores.jpg","6ta.jpg","10ma.png","rancho_cadetes","maniobras"]
    let pageFondo = ["Nuestros Monitores en 3er Año","Los reconocen ?","Parecen unos angelitos !","El rico arroz con frejoles","De maniobras en 4to año"]
    
    weak var delegate:ImagenesViewControllerDelegate?
    
    func viewControllerAtIndex(index:Int) -> PageItemController!{

        if ((pageTitles.count == 0) || (index >= pageTitles.count)){
            return nil
        }
        let pageContentVC = storyboard?.instantiateViewControllerWithIdentifier("itemController") as! PageItemController
        pageContentVC.topText = pageTitles[index] // aqui añadimos el contenido de un array
        pageContentVC.imageName = imagen[index]
        //pageContentVC.bottomText = String(format: "Page # %i of %i", index + 1,pageTitles.count)
        pageContentVC.bottomText = pageFondo[index]
        //let myHue:CGFloat = CGFloat(index) / CGFloat(pageTitles.count)
        //pageContentVC.color = UIColor(hue: myHue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        pageContentVC.pageIndex = index
        return pageContentVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = storyboard?.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController //
        pageViewController.dataSource = self
        let startingViewController = viewControllerAtIndex(0)
        let viewControllers:[UIViewController] = [startingViewController]
        pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
        
        view.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageItemController).pageIndex
        if (index == NSNotFound) {
            return nil
        }
        
        index += 1
        
        if (index == pageTitles.count) {
            return nil
        }
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageItemController).pageIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}
