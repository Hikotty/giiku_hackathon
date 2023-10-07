//
//  SignInViewController.swift
//  ChihoGuesser
//
//  Created by gkin on 2023/08/20.
//



import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    let imageView = UIImageView()
    
    
    let logoView = UIImageView()
    
    
    let emailField_ = UITextField()
    
    
    let passField = UITextField()
    
    
    let bottomButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(imageView)
        view.addSubview(logoView)
        view.addSubview(emailField_)
        view.addSubview(passField)
        view.addSubview(bottomButton)
        
        
        imageView.frame = view.bounds
        imageView.image = UIImage(named: "haikei")
        
        
        logoView.contentMode = .scaleAspectFit
        logoView.image = #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        
        emailField_.borderStyle = .roundedRect
        emailField_.attributedPlaceholder = NSAttributedString(
            string: "Email Address",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray.withAlphaComponent(0.7)]
        )
        emailField_.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        emailField_.baseTextColor(textColor: UIColor.systemBackground)
        emailField_.baseColor(backgroundColor: .label, opacity: 0.2)
        emailField_.translatesAutoresizingMaskIntoConstraints = false
        
        
        passField.borderStyle = .roundedRect
        passField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray.withAlphaComponent(0.7)]
        )
        passField.baseFont(font: .monospacedSystemFont(ofSize: 20, weight: .bold))
        passField.baseTextColor(textColor: UIColor.systemBackground)
        passField.baseColor(backgroundColor: .label, opacity: 0.2)
        passField.translatesAutoresizingMaskIntoConstraints = false
        
        
        //　後に追加
        bottomButton.setImage( #imageLiteral(resourceName: "mail").withRenderingMode(.alwaysOriginal), for: .normal)
        bottomButton.pressAction()
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.addTarget(self, action: #selector(jumptoNext), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            logoView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 150),
            logoView.heightAnchor.constraint(equalToConstant: 150),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 350),
            
            
            emailField_.topAnchor.constraint(equalTo: logoView.centerYAnchor, constant: 150),
            emailField_.heightAnchor.constraint(equalToConstant: 60),
            emailField_.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField_.widthAnchor.constraint(equalToConstant: 250),
            
            
            passField.topAnchor.constraint(equalTo: emailField_.centerYAnchor, constant: 80),
            passField.heightAnchor.constraint(equalToConstant: 60),
            passField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passField.widthAnchor.constraint(equalToConstant: 250),
            
            
            bottomButton.topAnchor.constraint(equalTo: passField.centerYAnchor, constant: 80),
            bottomButton.heightAnchor.constraint(equalToConstant: 60),
            bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomButton.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func Next(){
        
        
        let vc = StartViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true)
    }
    
    
    
    
    @objc func jumptoNext(){
        
        let email = emailField_.text ?? ""
        let password = passField.text ?? "Naist123"
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let user = result?.user {
                let req = user.createProfileChangeRequest()
                req.commitChanges() { [weak self] error in
                    guard let self = self else { return }
                    if error == nil {
                        user.sendEmailVerification() { [weak self] error in
                            guard let self = self else { return }
                            if error == nil {
                                
                                // 仮登録完了画面へ遷移する処理
                                self.Next()
                            }
                            //print(error?.localizedDescription)
                        }
                    }
                    //print(error?.localizedDescription)
                }
            }
            //print(error?.localizedDescription)
        }
    }
}
