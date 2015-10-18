//
//  FriendViewController.swift
//  Friendbook Parse
//
//  Created by Юрий Михайлов on 18.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//

import UIKit
import Parse

class FriendViewController: UIViewController {
    
    @IBOutlet weak var nameLabel     : UILabel!
    @IBOutlet weak var ageLabel      : UILabel!
    @IBOutlet weak var birthdayLabel : UILabel!
    @IBOutlet weak var phoneLabel    : UILabel!
    
    var friend : PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameLabel.text     = self.friend!["name"]     as? String
        self.ageLabel.text      = String(self.friend!["age"] as! Int) + " years old"
        self.birthdayLabel.text = self.friend!["birthday"] as? String
        self.phoneLabel.text    = self.friend!["phone"]    as? String
    }

}
