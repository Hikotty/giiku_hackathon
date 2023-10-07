//
//  EntranceViewController.swift
//  ChihoGuesser
//
//  Created by gkin on 2023/08/20.
//


import UIKit


class EntranceViewController: UIViewController {
    
    
    let imageView = UIImageView()
    
    
    let logoView = UIImageView()
    
    
    let topButton = UIButton()
    
    
    let midButton = UIButton()
    
    
    let bottomButton = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(imageView)
        view.addSubview(logoView)
        view.addSubview(topButton)
        view.addSubview(midButton)
        view.addSubview(bottomButton)
        
        imageView.frame = view.bounds
        imageView.image = UIImage(named: "haikei")
        
        
        logoView.contentMode = .scaleAspectFit
        logoView.image = #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal)
        logoView.translatesAutoresizingMaskIntoConstraints = false
                
        
        topButton.setImage( #imageLiteral(resourceName: "google").withRenderingMode(.alwaysOriginal), for: .normal)
        topButton.pressAction()
        topButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        midButton.setImage( #imageLiteral(resourceName: "Line").withRenderingMode(.alwaysOriginal), for: .normal)
        midButton.pressAction()
        midButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        bottomButton.setImage( #imageLiteral(resourceName: "mail").withRenderingMode(.alwaysOriginal), for: .normal)
        bottomButton.pressAction()
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.addTarget(self, action: #selector(jumptosignup), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            logoView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 150),
            logoView.heightAnchor.constraint(equalToConstant: 150),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 350),
            
            
            topButton.topAnchor.constraint(equalTo: logoView.centerYAnchor, constant: 150),
            topButton.heightAnchor.constraint(equalToConstant: 60),
            topButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topButton.widthAnchor.constraint(equalToConstant: 250),
            
            
            midButton.topAnchor.constraint(equalTo: topButton.centerYAnchor, constant: 80),
            midButton.heightAnchor.constraint(equalToConstant: 60),
            midButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            midButton.widthAnchor.constraint(equalToConstant: 250),
            

            bottomButton.topAnchor.constraint(equalTo: midButton.centerYAnchor, constant: 80),
            bottomButton.heightAnchor.constraint(equalToConstant: 60),
            bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomButton.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    
    @objc func jumptosignup(){
        
        let vc = LoginViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true)
    }

}
