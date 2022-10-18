//
//  ResponseModels.swift
//  NotesNexus
//
//  Created by Michael O'Dell on 10/17/22.
//

import Foundation
import SwiftUI
// Register and login Responses /////////////////
struct RegisterData: Codable {
    let id: Int
    let username: String
 
    init(id:Int, username:String){
        self.id = id
        self.username = username
    }
    
}
struct RegisterResponse: Codable {
    let data: RegisterData
    
    init(data: RegisterData) {
        self.data = data
    }
}

struct LoginResponse: Codable {
    let refresh: String
    let access: String
    
    init(refresh: String, access: String) {
        self.refresh = refresh
        self.access = access
    }
}
////////////////////////////////////////

//note and node responses and structs

struct Note: Codable, Hashable {
    let id: Int
    let title: String
    let body: String
    let node: Int
    
    init(id: Int, title: String, body: String, node: Int) {
        self.id = id
        self.title = title
        self.body = body
        self.node = node
    }
}

struct Node: Codable, Hashable {
    let id: Int
    let subject_title: String
    let notes: [Note]
    
    init(id:Int, subject_title: String, notes: [Note]){
        self.id = id
        self.subject_title = subject_title
        self.notes = notes
    }
}

