//
//  UbicacionViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import iAd
import AdSupport

protocol UbicacionViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class UbicacionViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, ADBannerViewDelegate {
    
    //var bannerView:ADBannerView?
    
    @IBOutlet weak var Banner: ADBannerView!
    
    @IBOutlet weak var mapa: MKMapView!
   
    @IBOutlet weak var distanciaLabel: UILabel!
    
    weak var delegate:UbicacionViewControllerDelegate?
    
    private let manejador = CLLocationManager()
    
    var distancia:Double = 0.0
    var distSting:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
        
        self.canDisplayBannerAds = true
        Banner?.delegate = self
        Banner?.hidden = true
        
        manejador.delegate = self
        manejador.desiredAccuracy = kCLLocationAccuracyBest
        manejador.requestWhenInUseAuthorization()
        
        var punto = CLLocationCoordinate2D()
        punto.latitude = -12.074587
        punto.longitude = -77.117921
        
        let span = MKCoordinateSpanMake(1,1)
        let region = MKCoordinateRegion(center: punto, span: span)
        mapa.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.title = "Colegio Militar Leoncio Prado"
        pin.subtitle = "El mejor Colegio del Peru"
        pin.coordinate = punto
        mapa.addAnnotation(pin)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse{
            manejador.startUpdatingLocation()
            mapa.showsUserLocation = true
        }else{
            manejador.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let cmlp = CLLocation(latitude: -12.074587, longitude: -77.117921)
        let actual = locations.last
        let dist = cmlp.distanceFromLocation(actual!)
        distancia = (dist/1000)
        distSting = String(format: "%.2f", distancia)
        distanciaLabel.text = "Distancia al CMLP: \(distSting) Kms"
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
    
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
