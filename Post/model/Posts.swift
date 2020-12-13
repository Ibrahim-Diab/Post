//
//  Posts.swift
//  Post
//
//  Created by deepo on 12/12/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import Foundation
class posts{
    
    
    var username :String
    var posttext:String
    var time : Data
    var numberoflikes :Int
    var numberofcomment:Int
    var userid :String
    
    init(username :String,posttext:String,time : Data,numberoflikes :Int,numberofcomment:Int,userid :String) {
        self.username = username
        self.posttext = posttext
        self.time = time
        self.numberoflikes = numberoflikes
        self.numberofcomment = numberofcomment
        self.userid = userid
    }
    
    
}
