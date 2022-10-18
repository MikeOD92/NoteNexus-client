//
//  ContentView.swift
//  NotesNexus
//
//  Created by Michael O'Dell on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @StateObject var login = LoginView()
    
    var body: some View {
        if (login.access == ""){
            VStack{
                Spacer()
                VStack{
                    TextField("Username/Email", text: $username)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                        .padding()
                    TextField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                        .padding()
                    // find way to obscure password field
                    Button{
                        Task{
                            login.fetch(username: username, password: password)
                            // this makes the call okay and gets the righr response back but does not save out access token in the access state. We will have to play with that.
                        }
                    }label: {
                        LoginButtonView(textColor: .white, backgroundColor: .yellow, title: "Login")
                    }
                }
                .frame(width: 400, height: 400)
                .padding()
                .background(.gray)
                .foregroundColor(.white)
                Spacer()
            }
        }else{
            VStack{
                Text("logged in sucessful")
            }
        }

    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
