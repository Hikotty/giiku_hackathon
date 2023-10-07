//
//  StartViewController.swift
//  ChihoGuesser
//
//  Created by Hikoto Iseda on 2023/08/19.
//

import UIKit

class StartViewController: UIViewController {
    
    let logoView = UIImageView()
    
    let backgroundImage = UIImageView()
    
    let button1 = UIButton()
    
    let button2 = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
        view.addSubview(backgroundImage)
        view.addSubview(logoView)
        view.addSubview(button1)
        view.addSubview(button2)
        
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(named: "haikei") // Replace with your actual image name
        
        
        logoView.contentMode = .scaleAspectFit
        logoView.image = #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setImage(UIImage(named: "gamestart"), for: .normal) // Replace with your actual image name
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setImage(UIImage(named: "ranking"), for: .normal) // Replace with your actual image name
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            
            logoView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 150),
            logoView.heightAnchor.constraint(equalToConstant: 150),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 350),
            
            
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 90), // Adjust the vertical position
            button1.widthAnchor.constraint(equalToConstant: 280), // Adjust the button width
            button1.heightAnchor.constraint(equalToConstant: 80),
            
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10), // Adjust the vertical position
            button2.widthAnchor.constraint(equalToConstant: 280), // Adjust the button width
            button2.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    
    @objc func button1Tapped() {
        // Action for button 1
        
        let vc = MapViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: false)
    }
    
    @objc func button2Tapped() {
//        // Action for button 2
//
//        let vc = MapViewController()
//        let nvc = UINavigationController(rootViewController: vc)
//        nvc.modalPresentationStyle = .fullScreen
//        present(nvc, animated: true)
    }
    
}
