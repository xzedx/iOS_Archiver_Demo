//
//  archiver.swift
//  QzArchiver
//
//  Created by 星 伍 on 15-3-24.
//  Copyright (c) 2015年 优才网(www.ucai.cn). All rights reserved.
//

import Foundation



//func archive(data:Dictionary<String,String>, filename:String)
//{
//    NSKeyedArchiver.archiveRootObject(data, toFile: filename)
//}
//
//func unarchive(filename:String) -> AnyObject!
//{
//    return NSKeyedUnarchiver.unarchiveObjectWithFile(filename)
//}

func archive(data:Dictionary<String, String>, filename:String)
{
    NSKeyedArchiver.archiveRootObject(data, toFile: filename)
}

func unarchive(filename:String) -> AnyObject!
{
    return NSKeyedUnarchiver.unarchiveObjectWithFile(filename)
}

func getCourseList() -> [Course]{
    var dir = NSHomeDirectory()
    var path = dir + "/courses.txt"
    println("!!")
    var checkValidation = NSFileManager.defaultManager()
    if checkValidation.fileExistsAtPath(path){
        var courseList:[Course] = (NSKeyedUnarchiver.unarchiveObjectWithFile(path) as [Course])
        println(courseList.count)
        return courseList
    }else {
        return [Course]()
    }
}

func saveCourse(course:Course){
    var dir = NSHomeDirectory()
    var path = dir + "/courses.txt"
    var checkValidation = NSFileManager.defaultManager()
    if checkValidation.fileExistsAtPath(path) {
        var courseList:[Course] = (NSKeyedUnarchiver.unarchiveObjectWithFile(path) as [Course])
        courseList.append(course)
        NSKeyedArchiver.archiveRootObject(courseList, toFile: path)
    }else{
        var courseList:[Course] = [Course]()
        NSKeyedArchiver.archiveRootObject(courseList, toFile: path)
    }
}

func getTeacherList() -> [Teacher]{
    //    println(dir)
    var dir = NSHomeDirectory()
    var path = dir + "/teachers.txt"
    var checkValidation = NSFileManager.defaultManager()
    if checkValidation.fileExistsAtPath(path){
        var teacherList:[Teacher] = (NSKeyedUnarchiver.unarchiveObjectWithFile(path) as [Teacher])
        return teacherList
    }else{
        return [Teacher]()
    }
}

func saveTeacher(teacher:Teacher){
//    println(dir)
    var dir = NSHomeDirectory()
    var path = dir + "/teachers.txt"
    var checkValidation = NSFileManager.defaultManager()
    if checkValidation.fileExistsAtPath(path){
        var teacherList:[Teacher] = (NSKeyedUnarchiver.unarchiveObjectWithFile(path) as [Teacher])
        teacherList.append(teacher)
        NSKeyedArchiver.archiveRootObject(teacherList, toFile: path)
    }else{
        var teacherList = [Teacher]()
        NSKeyedArchiver.archiveRootObject(teacherList, toFile: path)
    }
}




















