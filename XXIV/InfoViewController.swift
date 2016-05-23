//
//  InfoViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import iAd
import AdSupport

protocol InfoViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class InfoViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet weak var Banner: ADBannerView!
    weak var delegate:InfoViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
        
        self.canDisplayBannerAds = true
        Banner?.delegate = self
        Banner?.hidden = true
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
    
    // MARK:- Banner
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        Banner?.hidden = false
    }
    
//    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
//        return willLeave
//    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
        NSLog("Error!")
        Banner?.hidden = true
    }
}
