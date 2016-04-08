//
//  EntryDetailViewController.swift
//  ios-challenge-journal
//
//  Created by Jonathan Rogers on 4/8/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry?

    @IBOutlet weak var entryTextField: UITextField!
    
    @IBOutlet weak var entryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = entry {
            updateWithEntry(entry)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let entry = self.entry {
            
            entry.title = self.entryTextField.text!
            entry.bodyText = self.entryTextView.text
            
        } else {
        
        let newEntry = Entry(title: entryTextField.text!, bodyText: entryTextView.text, timestamp: "")
        
        EntryController.sharedController.addEntry(newEntry)
        
        
        }
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.entryTextField.text = entry.title
        self.entryTextView.text = entry.bodyText
    }
}










