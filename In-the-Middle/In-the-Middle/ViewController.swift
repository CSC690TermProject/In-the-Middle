//
//  ViewController.swift
//  In-the-Middle
//
//  Created by Justin Abarquez on 4/5/18.
//  Copyright © 2018 Justin Abarquez. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var minimalRetroStyle: GMSMapStyle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting ViewController as a delegate of locationManager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        //Google Maps API
        GMSServices.provideAPIKey("AIzaSyBJmHjPpr2ijDFSQjG-AUXC3r9Re4K2uGA")
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.478, zoom: 10.25)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        minimalRetroStyle = try! GMSMapStyle.init(contentsOfFileURL: Bundle.main.url(forResource: "minimalRetro", withExtension: "json")!)
        mapView.mapStyle = minimalRetroStyle
        view = mapView
        
        //        let locationA = CLLocationCoordinate2DMake(37.723324, -122.478082)
        //        let markerA = GMSMarker(position: locationA)
        //        markerA.title = "San Francisco State University"
        //        markerA.map = mapView
        //
        //        let locationB = CLLocationCoordinate2DMake(37.6879, -122.4702)
        //        let markerB = GMSMarker(position: locationB)
        //        markerB.title = "Berkeley"
        //        markerB.map = mapView
        
        //bar properties
        navigationItem.title = "DINE in the MIDDLE"
        self.navigationController?.navigationBar.barStyle  = UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor   = UIColor(red: 153/255, green: 204/255, blue: 0/255, alpha: 1.0)
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        let navigationTitleFont = UIFont(name: "Avenir", size: 22)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: navigationTitleFont]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

