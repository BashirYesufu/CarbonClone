//
//  AccountCreationViewController.swift
//  Carbon
//
//  Created by mac on 8/23/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK:- Creating the welcome text
    private let welcomeText: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Let's set things up. Please fill out these basic details \nto get started."
        text.font = UIFont(name: "Helvetica", size: 13)
        text.textAlignment = .center
        text.numberOfLines = 2
        return text
    }()
    
    //MARK:- Creating the first name label
    private let firstName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First name"
        return label
    }()
    
    //MARK:- Creating the first name text field
    private let firstNameDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    //MARK:- Creating the middle name label
    private let middleName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Middle name"
        return label
    }()
    
    //MARK:- Creating the middle name text field
    private let middleNameDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    //MARK:- Creating the surname label
    private let surName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Surname"
        return label
    }()
    
    //MARK:- Creating the surname text field
    private let surNameDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
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
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    //MARK:- Creating the gender label
    private let gender: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender"
        return label
    }()
    
    //MARK:- Creating the gender text field
    private let genderDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    //MARK:- Creating the phone number label
    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone number"
        return label
    }()
    
    //MARK:- Creating the phone number text field
    private let phoneNumberDetails: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.keyboardType = .numberPad
        return textField
    }()
    
    //MARK:- Creating the "create account" button
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
        button.addTarget(self, action: #selector(goToPersonalDetails), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()

    //MARK:- Creating the bottom stackview
    let bottomStack: UIStackView = {
        //Creating "&" label
        let andLabel: UILabel = {
           let text = UILabel()
           text.translatesAutoresizingMaskIntoConstraints = false
           text.text = "&"
           text.font = UIFont(name: "Helvetica", size: 13)
            text.textAlignment = .right
           return text
       }()
        //Creating "Privacy Policy" Button
        let privacyButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(" Privacy policy", for: .normal)
            button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
            button.backgroundColor = .white
            button.layer.cornerRadius = 10
            return button
        }()
        //Creating stackView
        let stack = UIStackView()
        stack.addArrangedSubview(andLabel)
        stack.addArrangedSubview(privacyButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    //MARK:- Creating the top stackview
    let topStack: UIStackView = {
        //Creating "continuing" label
        let acceptanceLabel: UILabel = {
           let text = UILabel()
           text.translatesAutoresizingMaskIntoConstraints = false
           text.text = "By continuing, you accept our"
           text.font = UIFont(name: "Helvetica", size: 13)
            text.textAlignment = .right
           return text
       }()
        //Creating "Terms of Service" Button
        let termsButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(" Terms of Service", for: .normal)
            button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
            button.backgroundColor = .white
            button.layer.cornerRadius = 10
            return button
        }()
        //Creating stackView
        let stack = UIStackView()
        stack.addArrangedSubview(acceptanceLabel)
        stack.addArrangedSubview(termsButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    //MARK:- Segue to personal details page
    @objc func goToPersonalDetails() {
        let personalController = PersonalDetailsViewController()
        navigationController?.pushViewController(personalController, animated: true)
    }
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        addDefaultViews()
        constraintViews()
    }
    
    //MARK:- Adding subviews and formatting main view
    func addDefaultViews() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Create your Carbon account"
        view.backgroundColor = .white
        
        view.addSubview(welcomeText)
        view.addSubview(firstName)
        view.addSubview(firstNameDetails)
        view.addSubview(middleName)
        view.addSubview(middleNameDetails)
        view.addSubview(surName)
        view.addSubview(surNameDetails)
        view.addSubview(email)
        view.addSubview(emailDetails)
        view.addSubview(password)
        view.addSubview(passwordDetails)
        view.addSubview(gender)
        view.addSubview(genderDetails)
        view.addSubview(phoneNumber)
        view.addSubview(phoneNumberDetails)
        view.addSubview(createAccountButton)
        view.addSubview(bottomStack)
        view.addSubview(topStack)
    }
    
    //MARK:- Constraining subviews to view
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            welcomeText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            welcomeText.leftAnchor.constraint(equalTo: view.leftAnchor),
            welcomeText.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            firstNameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            firstNameDetails.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -7),
            firstNameDetails.heightAnchor.constraint(equalToConstant: 40),
            firstNameDetails.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 50),
            
            firstName.bottomAnchor.constraint(equalTo: firstNameDetails.topAnchor, constant: -5),
            firstName.leftAnchor.constraint(equalTo: firstNameDetails.leftAnchor),
            
            middleNameDetails.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 7),
            middleNameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            middleNameDetails.heightAnchor.constraint(equalToConstant: 40),
            middleNameDetails.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 50),
            
            middleName.bottomAnchor.constraint(equalTo: middleNameDetails.topAnchor, constant: -5),
            middleName.leftAnchor.constraint(equalTo: middleNameDetails.leftAnchor),
            
            surNameDetails.topAnchor.constraint(equalTo: firstNameDetails.bottomAnchor, constant: 40),
            surNameDetails.heightAnchor.constraint(equalToConstant: 40),
            surNameDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            surNameDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            surName.bottomAnchor.constraint(equalTo: surNameDetails.topAnchor, constant: -5),
            surName.leftAnchor.constraint(equalTo: surNameDetails.leftAnchor),
            
            emailDetails.topAnchor.constraint(equalTo: surNameDetails.bottomAnchor, constant: 40),
            emailDetails.heightAnchor.constraint(equalToConstant: 40),
            emailDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            email.bottomAnchor.constraint(equalTo: emailDetails.topAnchor, constant: -5),
            email.leftAnchor.constraint(equalTo: emailDetails.leftAnchor),
            
            passwordDetails.topAnchor.constraint(equalTo: emailDetails.bottomAnchor, constant: 40),
            passwordDetails.heightAnchor.constraint(equalToConstant: 40),
            passwordDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            passwordDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            password.bottomAnchor.constraint(equalTo: passwordDetails.topAnchor, constant: -5),
            password.leftAnchor.constraint(equalTo: passwordDetails.leftAnchor),
            
            genderDetails.topAnchor.constraint(equalTo: passwordDetails.bottomAnchor, constant: 40),
            genderDetails.heightAnchor.constraint(equalToConstant: 40),
            genderDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            genderDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            gender.bottomAnchor.constraint(equalTo: genderDetails.topAnchor, constant: -5),
            gender.leftAnchor.constraint(equalTo: genderDetails.leftAnchor),
            
            phoneNumberDetails.topAnchor.constraint(equalTo: genderDetails.bottomAnchor, constant: 40),
            phoneNumberDetails.heightAnchor.constraint(equalToConstant: 40),
            phoneNumberDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            phoneNumberDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            phoneNumber.bottomAnchor.constraint(equalTo: phoneNumberDetails.topAnchor, constant: -5),
            phoneNumber.leftAnchor.constraint(equalTo: phoneNumberDetails.leftAnchor),
            
            bottomStack.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: 0),
            bottomStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            topStack.bottomAnchor.constraint(equalTo: bottomStack.topAnchor, constant: 6),
            topStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60),
            createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
        ])
    }
}

