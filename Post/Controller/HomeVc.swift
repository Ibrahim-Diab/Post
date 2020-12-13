//
//  ViewController.swift
//  Post
//
//  Created by deepo on 12/11/20.
//  Copyright © 2020 deepo. All rights reserved.

//  crtl +i
// cmd+shift+o

import UIKit
import Firebase
class HomeVc: UIViewController {
 
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    var items = [posts]()
    var collectionback : CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tablesetup()
        collectionback = Firestore.firestore().collection(Posts)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionback.getDocuments { (snaoshot, error) in
            if let err = error
            {
                
                print(err.localizedDescription)
            }
            else
            {
                guard let snap = snaoshot?.documents else {
                    return
                }
                for document in snap
                {
                    let data = document.data()
                    let username = data[UserName] ?? "noname"
                       let posttext = data[PostText] ?? ""
                       let numberoflikes = data[Numlikes]
                       let Numberoflikes = data[Numcomment]
                    let userid = document.documentID
                    let time = data[Time]
                    let newpost = posts(username: username as! String, posttext: posttext as! String, time: time as! Data, numberoflikes: Numberoflikes as! Int, numberofcomment: numberoflikes as! Int, userid: userid)
                    self.items.append(newpost)
                }
                
            }
        }
    }
    

}

