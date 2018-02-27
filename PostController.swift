//
//  PostController.swift
//  myFourSquare_IVAN
//
//  Created by Ivan Aldama on 20/02/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit

class Post {
    var user: User?
    var comments: Int = 0
    var imageUrl: String?
    var text: String?
    var likes:Int = 0
    
    init(text: String, imageUrl:String, user: User){
        self.text = text
        self.imageUrl = imageUrl
        self.user = user
    }
    
    func getLikes() -> Int {
        return likes
    }
    
    func incrementLikes() -> Void {
        likes+=1
    }
    
    func incrementComments() -> Void {
        comments+=1
    }
    
    func getComments() -> Int {
        return comments
    }
    
    func getDisplayTimeAgo(date: Date) -> String {
        return date.getTimeAgo()
    }
    
    func getCounters() -> (Int, Int) {
        return (comments, likes)
    }
    
    
}




