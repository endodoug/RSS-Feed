//
//  SafariActivity.swift
//  DHRSS
//
//  Created by doug harper on 7/7/15.
//  Copyright (c) 2015 Doug Harper. All rights reserved.
//

import UIKit

class SafariActivity: UIActivity {
    
    var _url : NSURL?
    
    override func activityType() -> String? {
        return NSStringFromClass(SafariActivity)
    }
    
    override func activityTitle() -> String? {
        return "Open in Safari"
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "safariIcon")
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for item in activityItems {
            if item.isKindOfClass(NSURL) && UIApplication.sharedApplication().canOpenURL(item as! NSURL) {
                return true
            }
        }
        return false
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for item in activityItems {
            if item.isKindOfClass(NSURL) {
                _url = (item as! NSURL)
            }
        }
    }
    
    override func performActivity() {
        if let url = _url {
            let completed = UIApplication.sharedApplication().openURL(url)
            self.activityDidFinish(completed)
        }
    }
    
}

