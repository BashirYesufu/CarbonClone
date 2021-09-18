//
//  SceneDelegate.swift
//  Carbon
//
//  Created by mac on 8/23/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootViewController = OnBoardingViewController()
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
       
       
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }

}
