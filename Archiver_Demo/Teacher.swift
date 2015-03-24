//
//  Teacher.swift
//  Archiver_Demo
//
//  Created by JJ on 15/3/24.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import Foundation

class Teacher: NSObject, NSCoding {
    var age:Int
    var from:String
    var name:String
//    var courses:[Course]
    
    init(Age age:Int, andFrom from:String, andName name:String) {
        self.age = age
        self.from = from
        self.name = name
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(age, forKey: "age")
        aCoder.encodeObject(from, forKey: "from")
        aCoder.encodeObject(name, forKey: "name")
//        aCoder.encodeObject(courses, forKey: "courses")
    }
    
    required init(coder aDecoder: NSCoder) {
        age = aDecoder.decodeIntegerForKey("age")
        from = aDecoder.decodeObjectForKey("from") as String
        name = aDecoder.decodeObjectForKey("name") as String
//        courses = aDecoder.decodeObjectForKey("courses") as [Course]
    }
    
}