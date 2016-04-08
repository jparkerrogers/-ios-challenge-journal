//
//  EntryTableViewController.swift
//  ios-challenge-journal
//
//  Created by Jonathan Rogers on 4/8/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntryController.sharedController.loadFromPersistentStorage()

    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedController.entries.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)

        let entry = EntryController.sharedController.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            EntryController.sharedController.entries.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailView" {
            
                // navigatigate the segue
            guard let destinationViewController = segue.destinationViewController as? EntryDetailViewController,
                //call a sender
            cell = sender as? UITableViewCell,
                // specify the location of the cell
            indexPath = tableView.indexPathForCell(cell) else {return}
            
                // pass the cells info
            let entry = EntryController.sharedController.entries[indexPath.row]
            
            destinationViewController.entry = entry
        
        }
    }
    
    
    

}
