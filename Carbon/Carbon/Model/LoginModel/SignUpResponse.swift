//
//  SignUpResponse.swift
//  Carbon
//
//  Created by mac on 8/27/21.
//

import Foundation

struct SignUpResponse: Decodable {

    let errorMessage: String?
    let data: SignUpResponseData?
}

struct SignUpResponseData: Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let middleName: String
    let email: String
    let password: String
}
