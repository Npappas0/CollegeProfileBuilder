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
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "ISU", location: "Illinois", numberOfStudents: 20788, image: UIImage(named: "ISU")!))
        colleges.append(College(name: "Purdue", location: "Indiana", numberOfStudents: 38770, image: UIImage(named: "Purdue")!))
        colleges.append(College(name: "Harper", location: "Illinois", numberOfStudents: 56441, image: UIImage(named: "Harper")!))
        
        
    }


}

