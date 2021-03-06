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

    var friends = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate   = self
        self.tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        updateFriends()
    }
    
    func updateFriends() {
        let query = PFQuery(className: "Friend")
        
        query.orderByDescending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { (friends: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.friends = friends!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let friend = self.friends[indexPath.row]
        
        let cell = UITableViewCell()
            cell.textLabel!.text = friend["name"] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let friend = self.friends[indexPath.row]
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.performSegueWithIdentifier("friendSegue", sender: friend)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.friends[indexPath.row].deleteInBackground()
            self.friends.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "friendSegue" {
            let friendVC = segue.destinationViewController as! FriendViewController
            
            friendVC.friend = sender as? PFObject
        }
    }

}
