//
//  LoginView.swift
//  NotesNexus
//
//  Created by Michael O'Dell on 10/17/22.
//

import Foundation
import SwiftUI

class LoginView: ObservableObject {
    
    @Published var data: LoginResponse = LoginResponse(refresh: "", access: "")
    @Published var access: String = ""
    
    func fetch(username: String, password:String){
    
        let url = URL(string:"http://localhost:8000/api/auth/login")
        var request = URLRequest(url: url!);
        request.httpMethod = "POST"
        
        let body = "username=\(username)&password=\(password)"
        request.httpBody = body.data(using: String.Encoding.utf8)
   
                
        let task = URLSession.shared.dataTask(with: request){
            [weak self] data, _, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    do{
                        let login = try JSONDecoder().decode(LoginResponse.self, from: data)
                        DispatchQueue.main.async {
                            self?.data = login
                            self?.access = String(login.access)
                            print(self?.access)
                            
                        }
                    }catch{
                        print(error)
                    }
                }
                task.resume()
    }
    
                                                  
                        
}
