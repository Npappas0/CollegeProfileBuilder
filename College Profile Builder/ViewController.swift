//
//  ViewController.swift
//  College Profile Builder
//
//  Created by NPappas on 1/20/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "ISU", location: "Illinois", numberOfStudents: 20788, image: UIImage(named: "ISU")!, url: "http://illinoisstate.edu/"))
        colleges.append(College(name: "Purdue", location: "Indiana", numberOfStudents: 38770, image: UIImage(named: "Purdue")!, url: "http://www.purdue.edu/"))
        colleges.append(College(name: "Harper", location: "Illinois", numberOfStudents: 56441, image: UIImage(named: "Harper")!, url: "http://goforward.harpercollege.edu/"))
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
    
    
    @IBAction func onPlusButtonTapped(sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Name Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Location Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add # of Students Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Website Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegeNameTextField = alert.textFields![0] as UITextField
            let collegeLocationTextField = alert.textFields![1] as UITextField
            let collegeEnrollmentTextField = alert.textFields![2] as UITextField
            let collegeWebsiteTextField = alert.textFields![3] as UITextField
            self.colleges.append(College(name: collegeNameTextField.text!, location: collegeLocationTextField.text!, numberOfStudents: Int(collegeEnrollmentTextField.text!)!, image: UIImage(named: "Default2")!, url: collegeWebsiteTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func onEditButtonTapped(sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            tableView.editing = true
            sender.tag = 1
        }
        else
        {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
}



