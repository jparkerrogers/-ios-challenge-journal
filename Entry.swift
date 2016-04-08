//
//  Entry.swift
//  ios-challenge-journal
//
//  Created by Jonathan Rogers on 4/8/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import Foundation


class Entry: Equatable {
    
    let kTitle = "title"
    let kBodyText = "bodyText"
    let kTimestamp = "timestamp"
    
    var title: String
    var bodyText: String
    var timestamp: String
    
    var dictionaryCopy: [String: AnyObject] {
        
        return [kTitle: title, kBodyText: bodyText, kTimestamp: timestamp]
    }
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let title = dictionary[kTitle] as? String,
        bodyText = dictionary[kBodyText] as? String,
        timestamp = dictionary[kTimestamp] as? String else {return nil}
        
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
    
    init(title: String, bodyText: String, timestamp: String) {
        self.title = title
        self.bodyText = bodyText
        self.timestamp = EntryController.sharedController.stringFromDate(NSDate())
    }

}

func == (lhs: Entry, rhs: Entry) -> Bool {
    
    return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}