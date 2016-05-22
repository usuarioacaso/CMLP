//
//  ViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import iAd
import AdSupport

protocol ViewControllerDelegate:NSObjectProtocol {
    func selectedIndexPath(indexPath:NSIndexPath)
}

class ViewController: UIViewController, ADBannerViewDelegate {
    
    //var bannerView:ADBannerView?
    
    @IBOutlet weak var Banner: ADBannerView!
    
    var itemsPrin: NSMutableArray!
    
    weak var delegate:ViewControllerDelegate?
    
        private let itemsMenu = ["Inicio", "Informacion", "Relaciones por Secciones", "Procedencia", "Imagenes","Ubicacion",""]
    
        private let itemsImage = ["browser_64px.png","compose_64px.png","document_64px.png","layers_64px.png","wallet_64px.png","pin_64px.png",""]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.canDisplayBannerAds = true
        Banner?.delegate = self
        Banner?.hidden = true
        
        view.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
    }

    func bannerViewDidLoadAd(banner: ADBannerView!) {
        Banner?.hidden = false
    }
    
    //func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
    //    return willLeave
    //}
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
        NSLog("Error!")
        Banner?.hidden = true
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsMenu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InicTableViewCell
        
        cell.label.text = itemsMenu[indexPath.row]
        let foto = itemsImage[indexPath.row]
        cell.imagen.image = UIImage(named: foto)
        cell.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.selectedIndexPath(indexPath)
    }
}



