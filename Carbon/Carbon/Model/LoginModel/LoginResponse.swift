

import Foundation

struct LoginResponse: Decodable {

    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData: Decodable {
    let password: String
    let id: String
    let email: String

    enum CodingKeys: String, CodingKey {
        case password
        case id = "id"
        case email
    }
}
