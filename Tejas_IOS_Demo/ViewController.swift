//
//  ViewController.swift
//  Tejas_IOS_Demo
//
//  Created by Tejas Narayanaswamy on 28/07/23.
//

import UIKit
import CleverTapSDK


class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func Event(_ sender: Any) {
           CleverTap.sharedInstance()?.recordEvent("Template Event")
        
       }
    
    @IBAction func Product_Clicked(_ sender: Any) {
           CleverTap.sharedInstance()?.recordEvent("Product Clicked")
        
       }
    
    @IBAction func Login(_ sender: Any) {
        let dob = NSDateComponents()
        dob.day = 24
        dob.month = 5
        dob.year = 1992
        let date = NSCalendar.current.date(from: dob as DateComponents)
        let profile: Dictionary<String, AnyObject> = [
            //Update pre-defined profile properties
            "Name": "Jack Montana" as AnyObject,
            "Email": "jack123@gmail.com" as AnyObject,
            "Identity": 99012345678 as AnyObject,
            "Phone": +9199012345678 as AnyObject,
            //Update custom profile properties
            "DOB":date! as AnyObject,
            "Plan type": "Silver" as AnyObject,
            "Favorite Food": "Pizza" as AnyObject,
        ]
        CleverTap.sharedInstance()?.onUserLogin(profile)
        
       }
}

