//
//  MapViewController.swift
//  ChihoGuesser
//
//  Created by gkin on 2023/08/19.
//
//

//
//  MapViewController.swift
//  ChihoGuesser
//
//  Created by gkin on 2023/08/19.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    let loactionBaseView = UIView()
    
    let areaLabel = UILabel()
    
    //let rangeLabel = UILabel()
    
    let hideButton = UIButton()
    
    let openButton = UIButton()
    
    let startButton = UIButton()
    
    
    let rankButton = UIButton()
    
    
    var lan = 32.79
    var lon = 130.69
    
    private var mapView = GMSMapView()
    private var panoView = GMSPanoramaView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // Or requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        setView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    
    override func loadView() {
        
        super.loadView()
        
        self.panoView.frame = .zero
        self.view = panoView
        
        self.panoView.moveNearCoordinate(CLLocationCoordinate2D(latitude: lan, longitude: lon))
        // Load the map at set latitude/longitude and zoom leve
    }
    
    
    override func viewDidLayoutSubviews() {
        
        setMap(Latitude: lan, Longtitude: lon)
    }
    
    
    func setMap(Latitude: CLLocationDegrees, Longtitude: CLLocationDegrees){
        
        let camera:GMSCameraPosition = GMSCameraPosition.camera(withLatitude: lan, longitude: lon, zoom: 11)
        mapView = GMSMapView(frame: .zero, camera: camera)
        loactionBaseView.addSubview(mapView)
        mapView.delegate = self
        mapView.frame = loactionBaseView.bounds
        loactionBaseView.bringSubviewToFront(hideButton)
        loactionBaseView.bringSubviewToFront(areaLabel)
    }
    
    func setView(){
        
        view.addSubview(loactionBaseView)
        view.addSubview(startButton)
        view.addSubview(rankButton)
        //loactionBaseView.addSubview(mapView)
        loactionBaseView.addSubview(areaLabel)
        //loactionBaseView.addSubview(rangeLabel)
        loactionBaseView.addSubview(hideButton)
        view.addSubview(openButton)
        
        
        loactionBaseView.backgroundColor = .clear
        loactionBaseView.clipsToBounds = true
        loactionBaseView.curveHalfTop(value: 20)
        loactionBaseView.translatesAutoresizingMaskIntoConstraints = false
        
            
        areaLabel.baseFont(font: .monospacedSystemFont(ofSize: 25, weight: .semibold))
        areaLabel.baseTextColor()
        areaLabel.baseColor(backgroundColor: .clear)
        areaLabel.textAlignment = .left
        areaLabel.text = "現在地"
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        hideButton.setTitle("x", for: .normal)
        hideButton.pressAction()
        hideButton.titleLabel?.font = .monospacedSystemFont(ofSize: 25, weight: .bold)
        hideButton.titleLabel?.textColor = .blue
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.addTarget(self, action: #selector(hideMap), for: .touchUpInside)
        
        
        openButton.setTitle("▲", for: .normal)
        openButton.pressAction()
        openButton.titleLabel?.font = .monospacedSystemFont(ofSize: 25, weight: .bold)
        openButton.titleLabel?.textColor = .blue
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.backgroundColor = .link
        openButton.clipsToBounds = true
        openButton.layer.cornerRadius = 25
        openButton.isHidden = true
        openButton.addTarget(self, action: #selector(hideMap2), for: .touchUpInside)
        
        
        startButton.setImage(UIImage(named: "find"), for: .normal)
        startButton.pressAction()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(Jumpresult), for: .touchUpInside)
        
        
        rankButton.setImage(UIImage(named: "rankingIcon"), for: .normal)
        rankButton.translatesAutoresizingMaskIntoConstraints = false
        rankButton.pressAction()
        rankButton.clipsToBounds = true
        rankButton.layer.cornerRadius = 25
        
        
        NSLayoutConstraint.activate([
            
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            rankButton.heightAnchor.constraint(equalToConstant: 50),
            rankButton.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: -15),
            rankButton.widthAnchor.constraint(equalToConstant: 50),
            rankButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            
            
            loactionBaseView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            loactionBaseView.widthAnchor.constraint(equalTo: view.widthAnchor),
            loactionBaseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loactionBaseView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            areaLabel.topAnchor.constraint(equalTo: loactionBaseView.topAnchor),
            areaLabel.widthAnchor.constraint(equalTo: loactionBaseView.widthAnchor, constant: -100),
            areaLabel.heightAnchor.constraint(equalToConstant: 50),
            areaLabel.leftAnchor.constraint(equalTo: loactionBaseView.leftAnchor, constant: 10),
            
            
//            mapView.topAnchor.constraint(equalTo: areaLabel.bottomAnchor),
//            mapView.widthAnchor.constraint(equalTo: loactionBaseView.widthAnchor),
//            mapView.bottomAnchor.constraint(equalTo: loactionBaseView.bottomAnchor),
//            mapView.centerXAnchor.constraint(equalTo: loactionBaseView.centerXAnchor),
            
            
            hideButton.topAnchor.constraint(equalTo: loactionBaseView.topAnchor),
            hideButton.widthAnchor.constraint(equalToConstant: 50),
            hideButton.heightAnchor.constraint(equalToConstant: 50),
            hideButton.rightAnchor.constraint(equalTo: loactionBaseView.rightAnchor, constant: -10),
            
            
            openButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            openButton.widthAnchor.constraint(equalToConstant: 50),
            openButton.heightAnchor.constraint(equalToConstant: 50),
            openButton.rightAnchor.constraint(equalTo: loactionBaseView.rightAnchor, constant: -10),
        ])
    }
    
    
    @objc func Jumpresult(){
        
        let vc = ResultViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true)
    }
    
    
    @objc func hideMap(){
        
        setMap(Latitude: lan, Longtitude: lon)
        
        if hideButton.isHidden == false{
            
            loactionBaseView.isHidden = true
            openButton.isHidden = false
            view.bringSubviewToFront(openButton)
        }
        else{
            
            loactionBaseView.isHidden = false
            openButton.isHidden = true
            view.bringSubviewToFront(openButton)
        }
    }
    
    @objc func hideMap2(){
        
        setMap(Latitude: lan, Longtitude: lon)
        
        if hideButton.isHidden == false{
            
            loactionBaseView.isHidden = true
            openButton.isHidden = false
            view.bringSubviewToFront(openButton)
        }
        else{
            
            loactionBaseView.isHidden = false
            openButton.isHidden = true
            view.bringSubviewToFront(openButton)
        }
    }
}


extension MapViewController {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
            
            lon = location.coordinate.longitude
            lan = location.coordinate.latitude
            
            setMap(Latitude: lan,  Longtitude: lon)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}
