//
//  Login.swift
//  Post
//
//  Created by deepo on 12/14/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class Login: UIViewController,GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil
        {
            print(error.localizedDescription)
        }
    }
    
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var gotocreteuser: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login.layer.cornerRadius = 15
        gotocreteuser.layer.cornerRadius = 15
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
   
           
          
    @IBAction func googlesignin(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    @IBAction func login(_ sender: Any) {
        guard let emailtxt = email.text,
            let passtxt = password.text
            else{return}
        Auth.auth().signIn(withEmail: emailtxt , password: passtxt) {  authResult, error in
            if  let err = error
            {
                print(err.localizedDescription)
            }
            else
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let home  =    storyboard.instantiateViewController(withIdentifier: "navigation")
                home.modalPresentationStyle = .fullScreen

                self.present(home, animated: true, completion: nil)
                
            }
        }
        
    }
    
    func firebaseslog (cerdential:AuthCredential)
    {
        Auth.auth().signIn(with: cerdential) { (AuthDataResult, Error) in
          if  let err = Error
            {
                print(err.localizedDescription)
            }
        }
        
    }
    
    @IBAction func gotocreteuser(_ sender: Any) {
        
//        guard let signup = storyboard?.instantiateViewController(identifier: "signup") as? SignUpController else { return  }
//        self.present(signup, animated: true, completion: nil)
    }
    
}
