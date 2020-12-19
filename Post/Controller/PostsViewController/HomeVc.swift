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
import FirebaseAuth
class HomeVc: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    var items = [posts]()
    var collectionback : CollectionReference!
    var listener: ListenerRegistration!
    var selected:String = "funny"
     //var handel:AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        tablesetup()
        collectionback = Firestore.firestore().collection(Posts)
    }
    override func viewWillAppear(_ animated: Bool) {
//        handel = Auth.auth().addStateDidChangeListener({ (Auth, user) in
//                      if user == nil
//                      {
//                          let storyboard = UIStoryboard(name: "Log", bundle: nil)
//                          let Homevc = storyboard.instantiateViewController(withIdentifier: "Logg")
//                           Homevc.modalPresentationStyle = .fullScreen
//                          self.present(Homevc , animated: true, completion: nil)
//                      }
//                      else
//                      {
//                           print("every thing is not ok")
//                      }
//                  })
        setlistener()
    }
    override func viewDidDisappear(_ animated: Bool) {
        listener.remove()
    }
    
    
    
    @IBAction func segement(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            selected = "funny"
        case 1:
            selected = "serious"
        case 2:
            selected = "crazy"
        default:
            selected = "popular"
        }
        
        listener.remove()
        setlistener()
    }
    
    func setlistener()
    {
        if selected ==  "popular"
        {
            listener =   collectionback.order(by: Numlikes, descending: true).addSnapshotListener{(snaoshot, error) in
                if let err = error
                {
                    print(err.localizedDescription)
                }
                else
                {
                   
                    self.items.removeAll()
                    self.items = posts.parsedata(snapshot: snaoshot)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                    
                    
                }
            }
            
        }
        else {
            listener =   collectionback.whereField(Category, isEqualTo: selected).order(by: Time, descending: true).addSnapshotListener{(snapshot, error) in
                if let err = error
                {
                    print(err.localizedDescription)
                }
                else
                {
                    self.items.removeAll()
                    
                    self.items =  posts.parsedata(snapshot: snapshot)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                    
                    
                }
            }
        }
        
    }
    
    @IBAction func signout(_ sender: Any) {
        
          let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        let storyboard = UIStoryboard(name: "Log", bundle: nil)
        let one  =  storyboard.instantiateViewController(withIdentifier: "Logg")
        one.modalPresentationStyle = .fullScreen
        self.present(one, animated: true, completion: nil)
        
    }
    
    
    
}

