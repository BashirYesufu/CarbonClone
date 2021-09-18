//
//  SignUpRequest.swift
//  Carbon
//
//  Created by mac on 8/27/21.
//

import Foundation

struct SignUpRequest: Encodable {
    
    var firstName: String
    var lastName: String
    var middleName: String
    var email: String
    var password: String
    var gender: String
    var phoneNumber: String
}
