//
//  UserDefaultsUtility.swift
//  Carbon
//
//  Created by mac on 8/26/21.
//

import Foundation

struct UserDefaultUtility {
    
    static func saveUserID(userID: String) {
        UserDefaults.standard.setValue(userID, forKey: "userID")
    }
    
    static func getUserID() -> String {
        return UserDefaults.standard.value(forKey: "userID") as! String
    }
}
