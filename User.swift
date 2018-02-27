//
//  User.swift
//  myFourSquare_IVAN
//
//  Created by Ivan Aldama on 20/02/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//
import Foundation

class User {
    var id: String?
    var name: String?
    var image: String?
    
    init(name: String, image: String){
        self.name = name
        self.image = image
        self.id = UUID().uuidString
    }
    
}

