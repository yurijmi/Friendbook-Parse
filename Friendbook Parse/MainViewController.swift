//
//  MainViewController.swift
//  Friendbook Parse
//
//  Created by Юрий Михайлов on 18.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate   = self
        self.tableView.dataSource = self
        
        createSampleFriend()
    }
    
    func createSampleFriend() {
        let sampleFriend = PFObject(className: "Friend")
        
        sampleFriend["name"]     = "John Doe"
        sampleFriend["age"]      = 23
        sampleFriend["birthday"] = "1th of April"
        sampleFriend["phone"]    = "+7 (555) 555-55-55"
        
        sampleFriend.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Sample Friend was saved.")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
            cell.textLabel!.text = "Cell"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        return
    }

}
