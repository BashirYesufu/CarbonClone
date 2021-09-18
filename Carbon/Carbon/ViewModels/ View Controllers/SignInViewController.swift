//
//  LoginViewCintroller.swift
//  Carbon
//
//  Created by mac on 8/24/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    let loginViewModel = LoginViewModel()
    
    //MARK:- Creating the logo
    private let carbonImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "carbon_image")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK:- Creating the welcome label
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hi there, welcome back. Please sign in."
        return label
    }()
    
    //MARK:- Creating the email label
    private let email: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        return label
    }()
    
    //MARK:- Creating the email text field
    private let emailDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    //MARK:- Creating the password label
    private let password: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        return label
    }()
    
    //MARK:- Creating the password text field
    private let passwordDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    //MARK:- Creating the "Sign In" Button
    private let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
        button.addTarget(self, action: #selector(goToPersonalDetails), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    @objc func goToPersonalDetails() {
        let request = LoginRequest(userEmail: emailDetails.text, userPassword: passwordDetails.text)
        loginViewModel.loginUser(loginRequest: request)
    }
    
    //MARK:- Creating the "New to Carbon" label
    private let newUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New to Carbon?"
        return label
    }()
    
    //MARK:- Creating the "Set up new account" button
    private let newAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set up new account", for: .normal)
        button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    //MARK:- Segue to create account page
    @objc func goToSignUp() {
        let signUpController = SignUpViewController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutItems()
        loginViewModel.delegate = self
    }
    
    //MARK:- Adding subviews and formatting main view
    func layoutItems() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(carbonImage)
        view.addSubview(welcomeLabel)
        view.addSubview(email)
        view.addSubview(emailDetails)
        view.addSubview(password)
        view.addSubview(passwordDetails)
        view.addSubview(signInButton)
        view.addSubview(newUserLabel)
        view.addSubview(newAccountButton)
        
        NSLayoutConstraint.activate([
        
            carbonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            carbonImage.heightAnchor.constraint(equalToConstant: 60),
            carbonImage.widthAnchor.constraint(equalToConstant: 210),
            carbonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: carbonImage.bottomAnchor, constant: -10),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailDetails.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 70),
            emailDetails.heightAnchor.constraint(equalToConstant: 60),
            emailDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            email.bottomAnchor.constraint(equalTo: emailDetails.topAnchor, constant: -10),
            email.heightAnchor.constraint(equalToConstant: 15),
            email.widthAnchor.constraint(equalToConstant: 130),
            email.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            passwordDetails.topAnchor.constraint(equalTo: emailDetails.bottomAnchor, constant: 40),
            passwordDetails.heightAnchor.constraint(equalToConstant: 60),
            passwordDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            passwordDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            password.bottomAnchor.constraint(equalTo: passwordDetails.topAnchor, constant: -10),
            password.heightAnchor.constraint(equalToConstant: 15),
            password.widthAnchor.constraint(equalToConstant: 130),
            password.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            newUserLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            newUserLabel.rightAnchor.constraint(equalTo: view.centerXAnchor),
            
            newAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newAccountButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 2),
            
            signInButton.bottomAnchor.constraint(equalTo: newUserLabel.bottomAnchor, constant: -70),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
    }
    
}
