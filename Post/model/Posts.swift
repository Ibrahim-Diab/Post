//
//  Posts.swift
//  Post
//
//  Created by deepo on 12/12/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import Foundation
import Firebase
struct posts{
    
    
    var username :String
    var posttext:String
    var time : Date
    var numberoflikes :Int
    var numberofcomment:Int
    var userid :String
    
    init(username :String,posttext:String,time : Date,numberoflikes :Int,numberofcomment:Int,userid :String) {
        self.username = username
        self.posttext = posttext
        self.time = time
        self.numberoflikes = numberoflikes
        self.numberofcomment = numberofcomment
        self.userid = userid
    }
    
    
    static func parsedata(snapshot:QuerySnapshot?) ->[posts]
    {
        var element = [posts]()
        guard let snap = snapshot?.documents else {
            return element
        }
        for document in snap
        {
            let data = document.data()
            let username = data[UserName]  as? String ?? "noname"
            let posttext = data[PostText] as? String ?? ""
            let numberoflikes = data[Numlikes] as? Int ?? 0
            let Numberofcomment = data[Numcomment] as? Int ?? 0
            let userid = document.documentID
            let time = data[Time] as? Date ?? Date()
            let newpost = posts(username: username , posttext: posttext, time: time , numberoflikes: numberoflikes , numberofcomment: Numberofcomment , userid: userid)
            element.append(newpost)
            
        }
        
        
        return element
    }
    
    
}
