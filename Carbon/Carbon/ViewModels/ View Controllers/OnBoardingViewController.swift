//
//  ViewController.swift
//  Carbon
//
//  Created by mac on 8/23/21.
//

import UIKit
import Lottie

class OnBoardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK:- Creating the logo
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "carbon_image")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK:- Creating the Account Setup Button
    private let setupAccount: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set up new account", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    //MARK:-Creating Collection View
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isPagingEnabled = true
        view.dataSource = self
        view.delegate = self
        view.clipsToBounds = true
        return view
    }()
    
    //MARK:- Creating Data for the Collection View
    let cellID = "cellID"
    let pages: [Page] = {
        let pageOne = Page(imageName: "page1", title: "Go beyond banking", message: "Welcome to the future. Carbon is your \npassport to world-class financial services, \nbuilt just for you.")
        let pageTwo = Page(imageName: "page2", title: "Stay on top of your finances. Anywhere. Anytime", message: "Carbon makes financial services faster, \ncheaper and more convenient. \nYou can access the app 24/7, \nwherever you are.")
        let pageThree = Page(imageName: "page3", title: "Trusted by millions", message: "With Carbon's market-leading \nservice already used by millions of people \njust like you, \nyou're in very good company.")
        return [pageOne, pageTwo, pageThree]
    }()
    
    //MARK:- Collection View Protocol Stubs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    //MARK:- Collection View Size Specification
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    //MARK:- "Skip" and "Sign Up" button displayed according to page scrolled
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        
        if pageNumber == 0 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(goToSignUp))
            
            formatBarButton()
            }
        if pageNumber != 0 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign in", style: .plain, target: self, action: #selector(goToSignIn))
            formatBarButton()
            }
    }
    
    //MARK:- Segue to sign in page
    @objc private func goToSignIn() {
        let signInController = SignInViewController()
            navigationController?.pushViewController(signInController, animated: true)
    }
    
    //MARK:- Segue to create account page
    @objc private func goToSignUp() {
        let signUpController = SignUpViewController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    //MARK:- Styling Bar button
    private func formatBarButton() {
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
        }
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutOnBoardingScreen()
    }
    
    //MARK:- Formating View
    private func layoutOnBoardingScreen() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(goToSignUp))
        formatBarButton()
       
        view.backgroundColor = .white
        view.addSubview(logo)
        view.addSubview(setupAccount)
        view.addSubview(collectionView)
        
        collectionView.anchorWithConstantsToTop(top: logo.bottomAnchor, left: view.leftAnchor, bottom: setupAccount.topAnchor, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 10, rightConstant: 0)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        
        NSLayoutConstraint.activate([
            //Laying The Logo In View
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logo.heightAnchor.constraint(equalToConstant: 70),
            logo.widthAnchor.constraint(equalToConstant: 210),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Laying The Account Creation Button In View
            setupAccount.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            setupAccount.heightAnchor.constraint(equalToConstant: 50),
            setupAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setupAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
