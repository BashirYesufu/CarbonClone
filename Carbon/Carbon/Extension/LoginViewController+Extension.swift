//
//  LoginViewController+Extension.swift
//  Carbon
//
//  Created by mac on 8/26/21.
//

import Foundation
import UIKit
extension SignInViewController: LoginViewModelDelegate {
    
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        
        if (loginResponse?.errorMessage == nil && loginResponse?.data != nil) {
            
            let personalDetails = PersonalDetailsViewController()
            self.navigationController?.pushViewController(personalDetails, animated: true)
            
        } else if (loginResponse?.errorMessage != nil) {
            
            guard let errorMessage = loginResponse?.errorMessage else {
                return
            }
            let alert = AlertService.alert(with: Constants.ErrorAlertTitle,
                                           message: errorMessage,
                                           alertStyle: .alert)
            
            self.present(alert, animated: true)
        }
    }
}
