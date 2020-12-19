//
//  customeCell.swift
//  Post
//
//  Created by deepo on 12/12/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit
import Firebase
class customeCell: UITableViewCell {
    
    @IBOutlet weak var likeimg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var posttext:UILabel!
    var post:posts!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func Configretion( post: posts)
    {
        
        username.text = post.username
        likes.text = String(post.numberoflikes)
        posttext.text = "“ \(post.posttext) ”"
        formater(post: post)
     
 
        
    }
    func formater(post:posts)
    {
        let format =  DateFormatter()
        format.dateFormat = "MMM d, hh:mm "
        time.text = format.string(from : post.time)
        
    }
    
}
/*  {
 //        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
 //        likeimg.addGestureRecognizer(tap)
 //        likeimg.isUserInteractionEnabled = true
 }
 //    @objc func imageTapped()
 //    {
 //     //   Firestore.firestore().collection(Posts).document(post.userid).setData([Numlikes : post.numberoflikes+1], merge: true)
 //        Firestore.firestore().collection(Posts).document(post.userid).updateData([Numlikes : post.numberoflikes+1])
 //
 //        // Your action
 //    }
 }*/
