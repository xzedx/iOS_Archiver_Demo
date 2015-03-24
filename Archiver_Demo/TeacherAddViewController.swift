//
//  TeacherAddViewController.swift
//  Archiver_Demo
//
//  Created by JJ on 15/3/24.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import UIKit

class TeacherAddViewController: UIViewController{
    @IBOutlet weak var textBirth: UITextField!
    @IBOutlet weak var textFrom: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var btnFinish: UIBarButtonItem!
   
    var datePicker:UIDatePicker?
    var fromPicker:UIPickerView?
    
    lazy var provinces = [
        "河北省",
        "山西省",
        "辽宁省",
        "吉林省",
        "黑龙江省",
        "江苏省",
        "浙江省",
        "安徽省",
        "福建省",
        "江西省",
        "山东省",
        "河南省",
        "湖北省",
        "湖南省",
        "广东省",
        "海南省",
        "四川省",
        "贵州省",
        "云南省",
        "陕西省",
        "甘肃省",
        "青海省",
        "台湾省",
        "内蒙古自治区",
        "广西壮族自治区",
        "西藏自治区",
        "宁夏回族自治区",
        "新疆维吾尔自治区",
        "香港特别行政区",
        "澳门特别行政区"
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker(frame: CGRectMake(0, 0, 200, 200))
        datePicker?.tag = 101
        datePicker?.datePickerMode = UIDatePickerMode.Date
        datePicker?.addTarget(self, action: Selector("dateValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        fromPicker = UIPickerView(frame: CGRectMake(0, 0, 200, 200))
        fromPicker?.delegate = self
        fromPicker?.dataSource = self
        fromPicker?.showsSelectionIndicator = true
        
        self.textFrom.inputView = fromPicker
        self.textBirth.inputView = datePicker
    }
    func dateValueChanged(sender:UIDatePicker){
        var str = sender.date.description
        var start = str.startIndex
        var end = advance(start, 10)
//        println("\(start)...\(end)")
        var range = start..<end
//        textBirth.text = str.substringWithRange(range)
        textBirth.text = (str as NSString).substringWithRange(NSRange(location: 0, length: 10))
    }
    @IBAction func addTeacher(sender: UIBarButtonItem) {
        var teacherName = textName.text
        var teacherFrom = textFrom.text
        var teacherBirth = textBirth.text
        
        if countElements(teacherName) == 0 {
            println("请输入老师名字")
            return
        }else if countElements(teacherFrom) == 0 {
            println("请输入籍贯")
            return
        }else if countElements(teacherBirth) == 0 {
            println("输入生日")
            return
        }

        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
//        println(_stdlib_getTypeName(formatter));
        var date = formatter.dateFromString(teacherBirth)
        var now = NSDate()
        var span = now.timeIntervalSinceDate(date!)
        var years = Int(span/365*86400)
        
        var newTeacher = Teacher(Age: years, andFrom: teacherFrom, andName: teacherName)
        saveTeacher(newTeacher)
        
        var alert = UIAlertController(title: "提示", message: "添加成功", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: { (act:UIAlertAction!) -> Void in
            self.navigationController?.popViewControllerAnimated(true)
            return
        })
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
//        var actionSheet = UIActionSheet(title: "添加成功", delegate: nil, cancelButtonTitle: nil, destructiveButtonTitle: "确定", otherButtonTitles: "取消")
//        actionSheet.showInView(self.view)
//        self.navigationController?.popViewControllerAnimated(true)
    }
}



extension TeacherAddViewController: UIPickerViewDelegate{
    
}
extension TeacherAddViewController:UIPickerViewDataSource{
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{                    return provinces.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.provinces[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFrom.text = provinces[row]
    }

}

























