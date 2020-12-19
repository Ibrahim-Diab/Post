//
//  AppDelegate.swift
//  Post
//
//  Created by deepo on 12/11/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        // Override point for customization after application launch.
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print(error)
            return
        }
        
        let controller  = GIDSignIn.sharedInstance()?.presentingViewController as? Login
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        controller?.firebaseslog(cerdential: credential)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home  =    storyboard.instantiateViewController(withIdentifier: "navigation")
        home.modalPresentationStyle = .fullScreen
        controller?.present(home, animated: true, completion: nil)
        
        
        // ...
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

