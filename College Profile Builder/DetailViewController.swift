//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by NPappas on 1/20/16.
//  Copyright © 2016 Nick Pappas. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var website: UITextField!
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
        website.text = college.url
    }
    
    @IBAction func onSaveTap(sender: AnyObject)
    {
        college.name = name.text!
        college.location = location.text!
        college.numberOfStudents = Int(enrollment.text!)!
        college.url = website.text!
        college.image = image.image
        name.resignFirstResponder()
        location.resignFirstResponder()
        enrollment.resignFirstResponder()
        website.resignFirstResponder()
    }
    
    @IBAction func goToWebsite(sender: AnyObject)
    {
        let svc = SFSafariViewController(URL: NSURL(string: website.text!)!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func takePhoto(sender: AnyObject)
    {
        let imagePickerActionSheet = UIAlertController(title: "Take/Upload Photo",
            message: nil, preferredStyle: .ActionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraButton = UIAlertAction(title: "Take Photo",
                style: .Default) { (alert) -> Void in
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .Camera
                    self.presentViewController(imagePicker,
                        animated: true,
                        completion: nil)
            }
            imagePickerActionSheet.addAction(cameraButton)
        }
        let libraryButton = UIAlertAction(title: "Choose Existing",
            style: .Default) { (alert) -> Void in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker,
                    animated: true,
                    completion: nil)
        }
        imagePickerActionSheet.addAction(libraryButton)
        let cancelButton = UIAlertAction(title: "Cancel",
            style: .Cancel) { (alert) -> Void in
        }
        imagePickerActionSheet.addAction(cancelButton)
        presentViewController(imagePickerActionSheet, animated: true,
            completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        dismissViewControllerAnimated(true) { () -> Void in
            self.image.image = selectedPhoto
        }
    }
    
}
