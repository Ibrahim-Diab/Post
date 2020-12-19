//
//  SignUpController.swift
//  Post
//
//  Created by deepo on 12/14/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpController: UIViewController {
    
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var Createuser: UIButton!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var usernametxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cancel.layer.cornerRadius = 15
        Createuser.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Createuser(_ sender: Any) {
        guard let email = emailtxt.text,
             let password = passwordtxt.text,
            let username = usernametxt.text else {return}
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
          if let err = error
            {
                print(err.localizedDescription)
            }
            
            guard let userid = user?.user.uid else {return}
            Firestore.firestore().collection(userref).document(userid).setData([UserName : username]) { (Error) in
               if let err = Error
               {
                print(err.localizedDescription)
                }
                else
               {
                self.dismiss(animated: true, completion: nil)
                }
                
            }
          
          
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
