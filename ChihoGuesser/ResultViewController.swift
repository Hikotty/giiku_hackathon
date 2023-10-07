////
////  ResultViewController.swift
////  ChihoGuesser
////
////  Created by Hikoto Iseda on 2023/08/20.
////
//
//import UIKit
//import GoogleMaps
//
//class ResultViewController: UIViewController, GMSMapViewDelegate {
//
//    private var mapView: GMSMapView!
//    private var circle : GMSCircle!
//    let locationManager = CLLocationManager()
//
//    let scoreLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 32)
//        label.text = "50点！"
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let camera:GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 32.80618, longitude: 130.705834, zoom: 13)
//        mapView = GMSMapView(frame: .zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        self.view = mapView
//        mapView.delegate = self
//
//        let path = GMSMutablePath()
//        path.add(CLLocationCoordinate2D(latitude: 32.80618, longitude: 130.705834))
//        path.add(CLLocationCoordinate2D(latitude: 32.7898771, longitude: 130.6899784))
//        let line = GMSPolyline(path: path)
//        line.strokeWidth = 2.5
//        line.strokeColor = .black
//        line.map = mapView
//
//        let marker1 = GMSMarker()
//        marker1.position = CLLocationCoordinate2D(latitude: 32.80618, longitude: 130.705834)
//        marker1.title = "あなたの位置"
//        if let customImage = UIImage(named: "foot") {
//            let resizedImage = resizeImage(image: customImage, targetSize: CGSize(width: 50, height: 50))
//            marker1.icon = resizedImage
//        }
//        marker1.map = mapView
//
//        let marker2 = GMSMarker()
//        marker2.position = CLLocationCoordinate2D(latitude: 32.7898771, longitude: 130.6899784)
//        marker2.title = "ゴール"
//        if let customImage = UIImage(named: "camera") {
//            let resizedImage = resizeImage(image: customImage, targetSize: CGSize(width: 50, height: 50))
//            marker2.icon = resizedImage
//        }
//        marker2.map = mapView
//
//        // Do any additional setup after loading the view.
//    }
//    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//        let size = image.size
//        let widthRatio = targetSize.width / size.width
//        let heightRatio = targetSize.height / size.height
//        let newSize: CGSize
//        if widthRatio > heightRatio {
//            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
//        } else {
//            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
//        }
//        let renderer = UIGraphicsImageRenderer(size: newSize)
//        let resizedImage = renderer.image { _ in
//            image.draw(in: CGRect(origin: .zero, size: newSize))
//        }
//        return resizedImage
//    }
//
//}
//
////
////  ResultViewController.swift
////  ChihoGuesser
////
////  Created by Hikoto Iseda on 2023/08/20.
////
//
////
////  ResultViewController.swift
////  ChihoGuesser
////
////  Created by Hikoto Iseda on 2023/08/20.
////
//
//import UIKit
//import GoogleMaps
//
//class ResultViewController: UIViewController, GMSMapViewDelegate {
//
//    private var mapView: GMSMapView!
//    private var circle: GMSCircle!
//    let locationManager = CLLocationManager()
//
//    let scoreLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 32)
//        label.text = "50点！"
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 32.80618, longitude: 130.705834, zoom: 15) // Adjusted zoom level
//
//        // Add scoreLabel to the top of the view with styling and layout adjustments
//        view.addSubview(scoreLabel)
//        scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scoreLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true // Adjust label height
//
//        mapView = GMSMapView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100), camera: camera) // Reduced map height and positioned below the label
//        mapView.isMyLocationEnabled = true
//        self.view.addSubview(mapView) // Added the map view as a subview
//
//        mapView.delegate = self
//
//        let path = GMSMutablePath()
//        path.add(CLLocationCoordinate2D(latitude: 32.80618, longitude: 130.705834))
//        path.add(CLLocationCoordinate2D(latitude: 32.7898771, longitude: 130.6899784))
//        let line = GMSPolyline(path: path)
//        line.strokeWidth = 2.5
//        line.strokeColor = .black
//        line.map = mapView
//
//        let marker1 = GMSMarker()
//        marker1.position = CLLocationCoordinate2D(latitude: 32.80618, longitude: 130.705834)
//        marker1.title = "あなたの位置"
//        if let customImage = UIImage(named: "foot") {
//            let resizedImage = resizeImage(image: customImage, targetSize: CGSize(width: 50, height: 50))
//            marker1.icon = resizedImage
//        }
//        marker1.map = mapView
//
//        let marker2 = GMSMarker()
//        marker2.position = CLLocationCoordinate2D(latitude: 32.7898771, longitude: 130.6899784)
//        marker2.title = "ゴール"
//        if let customImage = UIImage(named: "camera") {
//            let resizedImage = resizeImage(image: customImage, targetSize: CGSize(width: 50, height: 50))
//            marker2.icon = resizedImage
//        }
//        marker2.map = mapView
//
//        // Do any additional setup after loading the view.
//    }
//
//    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//        let size = image.size
//        let widthRatio = targetSize.width / size.width
//        let heightRatio = targetSize.height / size.height
//        let newSize: CGSize
//        if widthRatio > heightRatio {
//            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
//        } else {
//            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
//        }
//        let renderer = UIGraphicsImageRenderer(size: newSize)
//        let resizedImage = renderer.image { _ in
//            image.draw(in: CGRect(origin: .zero, size: newSize))
//        }
//        return resizedImage
//    }
//}

import UIKit
import GoogleMaps

class ResultViewController: UIViewController, GMSMapViewDelegate {
    
    private var mapView: GMSMapView!
    private var circle: GMSCircle!
    let locationManager = CLLocationManager()
    var recordScore: String = ""
    
    let scoreLabelBackground: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = UIColor(white: 0, alpha: 0.5)
        background.layer.cornerRadius = 10
        return background
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.text = "Loading..." // Placeholder text while loading
        return label
    }()
    
    let marker1Latitude = 32.80618
    let marker1Longitude = 130.705834
    let marker2Latitude = 32.7898771
    let marker2Longitude = 130.6899784
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: marker1Latitude, longitude: marker1Longitude, zoom: 15)
        
        mapView = GMSMapView(frame: view.bounds, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        mapView.addSubview(scoreLabelBackground)
        mapView.addSubview(scoreLabel)
        
        scoreLabelBackground.centerXAnchor.constraint(equalTo: mapView.centerXAnchor).isActive = true
        scoreLabelBackground.topAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        scoreLabelBackground.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20).isActive = true
        scoreLabelBackground.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20).isActive = true
        scoreLabelBackground.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        scoreLabel.centerXAnchor.constraint(equalTo: mapView.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: scoreLabelBackground.centerYAnchor).isActive = true
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: marker1Latitude, longitude: marker1Longitude))
        path.add(CLLocationCoordinate2D(latitude: marker2Latitude, longitude: marker2Longitude))
        let line = GMSPolyline(path: path)
        line.strokeWidth = 2.5
        line.strokeColor = .black
        line.map = mapView
        
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: marker1Latitude, longitude: marker1Longitude)
        marker1.title = "あなたの位置"
        if let customImage = UIImage(named: "foot") {
            let resizedImage = resizeImage(image: customImage, targetSize: CGSize(width: 50, height: 50))
            marker1.icon = resizedImage
        }
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: marker2Latitude, longitude: marker2Longitude)
        marker2.title = "ゴール"
        if let customImage = UIImage(named: "camera") {
            let resizedImage = resizeImage(image: customImage, targetSize: CGSize(width: 50, height: 50))
            marker2.icon = resizedImage
        }
        marker2.map = mapView
        
        // Add back button
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "return"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        mapView.addSubview(backButton)
        
        backButton.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        backButton.centerXAnchor.constraint(equalTo: mapView.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // Call API
        callAPI()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func backButtonPressed() {
        postRecordScore()
        navigationController?.popViewController(animated: true)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: newSize))
        }
        return resizedImage
    }
    
    //http://52.195.181.154:8080/score
    func callAPI() {
        let urlString = "http://52.195.181.154:8080/score" // Replace with your actual API URL
        
        guard let url = URL(string: urlString) else {
            scoreLabel.text = "Invalid URL"
            return
        }
        
        let parameters: [String: Any] = [
            "t_lat": marker1Latitude,
            "t_lng": marker1Longitude,
            "e_lat": marker2Latitude,
            "e_lng": marker2Longitude,
            "passedTime": 1000
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.scoreLabel.text = "API Error"
                }
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                let score = "点！"
                let x = responseString + score
                let cleanedText = x.replacingOccurrences(of: "\n", with: " ")
                print(cleanedText)
                self.recordScore = responseString
                //let score = "\(responseString) aaaa"
                DispatchQueue.main.async {
                    self.scoreLabel.text = cleanedText // Set the label text to the response body
                }
            } else {
                DispatchQueue.main.async {
                    self.scoreLabel.text = "Response Error"
                }
            }
        }.resume()
    }
    
    func postRecordScore() {
        let urlString = "http://52.195.181.154:8080/record" // Replace with your actual API URL
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let parameters: [String: Any] = [
            "id": 789,
            "username":"hikto",
            "score": self.recordScore // Use the stored score
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        URLSession.shared.dataTask(with: request) { data, response, error in
            print(response)
            if error == nil {
                print("Score recorded successfully")
            } else {
                print("Error recording score:", error?.localizedDescription ?? "")
            }
        }.resume()
    }
}

