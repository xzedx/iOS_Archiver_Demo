//
//  CourseListViewController.swift
//  Archiver_Demo
//
//  Created by JJ on 15/3/24.
//  Copyright (c) 2015年 JJ. All rights reserved.
//

import UIKit

class CourseListViewController: UITableViewController {
    var courseList:[Course]!
    var cellId = "courseCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.courseList = getCourseList()
        self.tableView.reloadData()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as UITableViewCell
        var course = courseList[indexPath.row] as Course
        cell.textLabel?.text = "\(course.name) $\(course.price) in \(course.date)"
        return cell
    }
    
}