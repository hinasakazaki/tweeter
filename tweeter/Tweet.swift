//
//  Tweet.swift
//  tweeter
//
//  Created by Hina Sakazaki on 10/3/15.
//  Copyright © 2015 Hina Sakazaki. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var author: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var dictionary : NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        author = dictionary["user"] as? User
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    class func tweetsWithArray(array:[NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary:dictionary))
        }
        
        return tweets
    }
}
