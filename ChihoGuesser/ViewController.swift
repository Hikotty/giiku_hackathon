//
//  ViewController.swift
//  ChihoGuesser
//
//  Created by gkin on 2023/08/19.
//

import UIKit
import GoogleMaps

class ViewController3: UIViewController, GMSMapViewDelegate {
    
    private var mapView: GMSMapView!
    
    private var circle : GMSCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = .red
        
        // Load the map at set latitude/longitude and zoom level
        let camera:GMSCameraPosition = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 11)
        
        mapView = GMSMapView(frame: .zero, camera: camera)
        
        
        self.view = mapView
        mapView.delegate = self
        
        
        // Add a single marker with a custom icon
        let mapCenter = CLLocationCoordinate2DMake(mapView.camera.target.latitude, mapView.camera.target.longitude)
        let marker = GMSMarker(position: mapCenter)
        
        marker.icon = UIImage(systemName: "pencil")
        marker.map = mapView
        
        
        circle = GMSCircle(position: marker.position, radius: 800)
        circle?.fillColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 0.5)
        circle?.map = mapView
        
    }
}

