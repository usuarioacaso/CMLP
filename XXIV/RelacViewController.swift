//
//  RelacViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import iAd
import AdSupport

protocol RelacViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class RelacViewController: UIViewController, ADBannerViewDelegate {
    
    weak var delegate:RelacViewControllerDelegate?
    
    @IBOutlet weak var Banner: ADBannerView!
    
    let listaSec = ["PRIMERA","SEGUNDA","TERCERA","CUARTA","QUINTA","SEXTA","SEPTIMA","OCTAVA","NOVENA","DECIMA","UNDECIMA"]
    
    @IBOutlet weak var labelPicker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
        
        self.canDisplayBannerAds = true
        Banner?.delegate = self
        Banner?.hidden = true
        
        labelPicker.text = listaSec[0]
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }

     // MARK: - Navigation
     
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     let vistadetalle = segue.destinationViewController as! DetalleViewController
     let datoapasar1 = labelPicker.text
        vistadetalle.data1 = datoapasar1
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

    // MARK:- Extension

extension RelacViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return listaSec.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listaSec[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let seccion = listaSec[row]
        return labelPicker.text = seccion
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        var pickerLabel = view as! UILabel!
        if view == nil {
            pickerLabel = UILabel()
            let hue = CGFloat(row)/CGFloat(listaSec.count)
            pickerLabel.backgroundColor = UIColor(hue: hue,saturation:1.0, brightness: 1.0, alpha:1.0)
            pickerLabel.textAlignment = .Center
        }
        let titleData = listaSec[row]
        let myTitle = NSAttributedString(string: titleData,attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 20.0)!, NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel.attributedText = myTitle
        return pickerLabel
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 280
    }
    
}
