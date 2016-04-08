//
//  EntryController.swift
//  ios-challenge-journal
//
//  Created by Jonathan Rogers on 4/8/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedController = EntryController()
    
    let kEntries = "entries"
    
    var entries: [Entry] = []
    
    func addEntry (entry: Entry) {
        
        entries.append(entry)
        
        self.saveToPersistentStorage()
    }
    
    func editEntry(entry: Entry) {
        
        
    }
    
    func deleteEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            
        }
    }
    
    func saveToPersistentStorage() {
        
        var entryDictionariesArray: [[String: AnyObject]] = []
        
        for entry in entries {
            
            let dictionaryCopy = entry.dictionaryCopy
            entryDictionariesArray.append(dictionaryCopy)
        }
        NSUserDefaults.standardUserDefaults().setObject(entryDictionariesArray, forKey: kEntries)
    }
    
    func loadFromPersistentStorage() {
        
        if let entryDictionariesArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntries) as? [[String: AnyObject]]{
            var entryArray: [Entry] = []
            
            for entryDictionary in entryDictionariesArray {
                if let entry = Entry(dictionary: entryDictionary) {
                    entryArray.append(entry)
                }
            }
            self.entries = entryArray
        }
    }
}

extension EntryController {
    
    func stringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        
        return dateFormatter.stringFromDate(NSDate())
    }
}









