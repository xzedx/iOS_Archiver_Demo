//
//  TeacherListViewController.swift
//  Archiver_Demo
//
//  Created by JJ on 15/3/24.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import UIKit

class TeacherListViewController: UITableViewController {
    var teacherList:[Teacher]!
    var cellId = "teacherCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:self.cellId)
    }
    
    override func viewWillAppear(animated: Bool) {
        teacherList = getTeacherList()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return teacherList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellId, forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        var teacher = self.teacherList[indexPath.row] as Teacher
        cell.textLabel?.text = "\(teacher.name) \(teacher.from) \(teacher.age)"
        return cell
    }
}