//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by NPappas on 1/20/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var enrollment: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var college: College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        name.text = college.name
        location.text = college.location
        enrollment.text = String(college.numberOfStudents)
        image.image = college.image
    }
    
    @IBAction func onSaveTap(sender: AnyObject)
    {
        college.name = name.text!
        college.location = location.text!
        college.numberOfStudents = Int(enrollment.text!)!
    }
}
