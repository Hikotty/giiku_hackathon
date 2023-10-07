//
//  ItemViewController.swift
//  ChihoGuesser
//
//  Created by Hikoto Iseda on 2023/08/20.
//

import UIKit


class ItemViewController: UIViewController {
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "haikei") // Replace with your background image name
        return imageView
    }()
    
    let shopNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "50 ポイントゲット！"
        return label
    }()
    
    let storeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "points")
        return imageView
    }()
    
    let imageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "return"), for: .normal)
        button.addTarget(ItemViewController.self, action: #selector(imageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(shopNameLabel)
        view.addSubview(storeImageView)
        view.addSubview(imageButton)
        
        NSLayoutConstraint.activate([
            shopNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            shopNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            storeImageView.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 50),
            storeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storeImageView.heightAnchor.constraint(equalToConstant: 450), // Adjust the image height
            storeImageView.widthAnchor.constraint(equalToConstant: 500),  // Adjust the image width
            
            imageButton.topAnchor.constraint(equalTo: storeImageView.bottomAnchor, constant: 50),
            imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButton.widthAnchor.constraint(equalToConstant: 280),
            imageButton.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    @objc func imageButtonTapped() {
        // Action for the image button
    }
}
