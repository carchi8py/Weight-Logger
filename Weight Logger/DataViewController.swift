//
//  DataViewController.swift
//  Weight Logger
//
//  Created by Chris Archibald on 10/9/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    //When we change our property through code (and viewDidLoad didn't call we want to do this so we don't get stale data
    var weight: Double? {
        didSet{
            if let weight = weight {
                WeightTextField.text = "\(weight)"
            }
        }
    }
    var date: NSDate? {
        didSet {
            if let date = date {
                datePicker.date = date
            }
        }
    }
    
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DataViewControler.viewDidLoad")

        if let weight = weight {
            WeightTextField.text = "\(weight)"
        }
        if let date = date {
            datePicker.date = date
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
