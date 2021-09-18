

import Foundation

struct LoginResource {
    
    func loginUser(loginRequest: LoginRequest, completionHandler: @escaping (_ result: LoginResponse?) -> Void) {
        
        let loginURL = URL(string: ApiEndpoints.signIn)!
        let httpUtility = HTTPUtility()
        
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postAPIData(requestUrl: loginURL, requestBody: loginPostBody, resultType: LoginResponse.self) { loginAPIResponse in
                
                completionHandler(loginAPIResponse)
            }
            
        } catch let error {
            debugPrint(error)
        }
    }
}
