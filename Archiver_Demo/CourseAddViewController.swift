//
//  CourseAddViewController.swift
//  Archiver_Demo
//
//  Created by JJ on 15/3/24.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import UIKit

class CourseAddViewController: UIViewController {
    
    @IBOutlet weak var btnFinish: UIBarButtonItem!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDate: UITextField!    
    @IBOutlet weak var textPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var datePicker = UIDatePicker(frame: CGRectMake(0, 0, 200, 200))
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.addTarget(self, action: Selector("dateValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
            
        textDate.inputView = datePicker
    }
    
    func dateValueChanged(sender:UIDatePicker){
        self.textDate.text = (sender.date.description as NSString).substringWithRange(NSRange(location: 0, length: 10))
    }
    
    @IBAction func addCourse(sender: UIBarButtonItem) {
        var courseName = textName.text
        var courseDate = textDate.text
        var coursePrice = textPrice.text
        
        if countElements(courseName) == 0 {
            println("请输入课程名字")
            return
        } else if countElements(courseDate) == 0 {
            println("输入日期")
            return
        }else if countElements(coursePrice) == 0 {
            println("输入价格")
            return
        }
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var date = formatter.dateFromString(courseDate)!
        
        var newCourse = Course(name: courseName, price: coursePrice.toInt()!, date: date)
        saveCourse(newCourse)
        
        var alert = UIAlertController(title: "提示", message: "添加成功", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: { (act:UIAlertAction!) -> Void in
            self.navigationController?.popViewControllerAnimated(true)
            return
        })
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}





















