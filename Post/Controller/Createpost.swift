//
//  Createpost.swift
//  Post
//
//  Created by deepo on 12/11/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit
import Firebase

class Createpost: UIViewController {
    
    @IBOutlet weak var post: UIButton!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var usertxt: UITextField!
    @IBOutlet weak var segmentcontrol: UISegmentedControl!
     var selectedcategory : String = "funny"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
        // Do any additional setup after loading the view.
    }
  
    
    func setup ()
    {
        post.layer.cornerRadius = 4
        textview.layer.cornerRadius = 4
        textview.text = " Write your post.... "
        textview.textColor = #colorLiteral(red: 0.2743373811, green: 0.2743446529, blue: 0.2743407488, alpha: 1)
        textview.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textview.delegate = self
        navigationItem.title = "Hi"
    }
    
    @IBAction func post(_ sender: Any) {
        Firestore.firestore().collection(Posts).addDocument(data:
            [UserName : usertxt.text!,
             Category : selectedcategory,
             Numlikes : 0,
             Numcomment : 0,
            PostText : textview.text!,
            Time: FieldValue.serverTimestamp(),
                
            ])
        { (error) in
            if let err = error
            {
                print(err.localizedDescription)
            }
            else
            {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }

    
    @IBAction func segmentcontrol(_ sender: Any) {
        let statues = segmentcontrol.selectedSegmentIndex
        switch statues {
        case 0:
            selectedcategory = "funny"
            case 1:
            selectedcategory = "serious"
        default:
           selectedcategory = "crazy"
        }
        
    }
    
}
extension Createpost : UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textview.text = ""
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
