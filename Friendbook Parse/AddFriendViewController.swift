//
//  AddFriendViewController.swift
//  Friendbook Parse
//
//  Created by Юрий Михайлов on 19.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//

import UIKit
import Parse

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var nameField     : UITextField!
    @IBOutlet weak var ageField      : UITextField!
    @IBOutlet weak var birthdayField : UITextField!
    @IBOutlet weak var phoneField    : UITextField!
    
    @IBAction func cancelTapped(button: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveTapped(button: UIBarButtonItem) {
        let newFriend = PFObject(className: "Friend")
        
        newFriend.setObject(self.nameField.text!, forKey: "name")
        newFriend.setObject(Int(self.ageField.text!)!, forKey: "age")
        newFriend.setObject(self.birthdayField.text!, forKey: "birthday")
        newFriend.setObject(self.phoneField.text!, forKey: "phone")
        
        newFriend.saveInBackgroundWithBlock { (saved: Bool, error: NSError?) -> Void in
            if saved {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
}
