//
//  Course.swift
//  Archiver_Demo
//
//  Created by JJ on 15/3/24.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import Foundation
class Course: NSObject, NSCoding {
    var date:NSDate
    var name:String
    var price:Int
    
    init(name:String, price:Int, date:NSDate){
        self.name = name
        self.price = price
        self.date = date
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(date, forKey: "date")
        aCoder.encodeInteger(price, forKey: "price")
        aCoder.encodeObject(name, forKey: "name")
    }
    required init(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObjectForKey("date") as NSDate
        self.price = Int(aDecoder.decodeIntForKey("price"))
        self.name = aDecoder.decodeObjectForKey("name") as String
    }
}