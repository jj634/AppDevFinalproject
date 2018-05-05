//
//  File.swift
//  personaltrainer
//
//  Created by Jason Jung on 4/26/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import Foundation
import SwiftyJSON

//class Routine {
//
//    var image: String
//
//    var selected: Bool
//
////    Below: from Routine1
//
//    var name: String
//    var lvl: String
//    var goal: String
//
//
//    var link: URL?
//
//
//
//
//    init(name: String, lvl: String, goal: String, image: String, selected: Bool, link: URL) {
//        self.name = name
//        self.lvl = lvl
//        self.goal = goal
//        self.image = image
//        self.selected = selected
//        self.link = link
//
//
//    }
//}


class Routine: NSObject {
    
    
    var selected: Bool = false

//    Below from backend
    
    var name: String
    var lvl: String
    var goal: String
    var link: URL?
    
    var ex1: String
    var ex2: String
    var ex3: String

    var dur1: String
    var dur2: String
    var dur3: String
    
    
    
    
    init(name: String, lvl: String, goal: String, link: URL, ex1: String, ex2: String, ex3: String, dur1: String, dur2: String, dur3: String) {
        
//        name: String, lvl: String, goal: String, image: String, link: URL, ex1: String, ex2: String, ex3: String, dur1: String, dur2: String, dur3: String
        
        self.name = name
        self.lvl = lvl
        self.goal = goal
        self.link = link

        self.ex1 = ex1
        self.ex2 = ex2
        self.ex3 = ex3

        self.dur1 = dur1
        self.dur2 = dur2
        self.dur3 = dur3
        
       
        self.selected = false
        
        
    }
    
    init(from json: JSON) {
        self.name = json["routine"].stringValue
        self.lvl = json["intensity"].stringValue
        self.goal = json["category"].stringValue
        self.link = json["url"].url
        
        self.ex1 = json["exercise1"].stringValue
        self.ex2 = json["exercise2"].stringValue
        self.ex3 = json["exercise3"].stringValue

        self.dur1 = json["duration1"].stringValue
        self.dur2 = json["duration2"].stringValue
        self.dur3 = json["duration3"].stringValue
        
        self.selected = false

    }
    
}

class Filter {
    

    var name: String
    var selected: Bool
    
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
}
