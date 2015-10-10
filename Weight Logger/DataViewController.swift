//
//  DataViewController.swift
//  Weight Logger
//
//  Created by Chris Archibald on 10/9/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

protocol DataViewControllerDelegate {
    //success
    func dataViewController(dataViewController:DataViewController, didPickDate date: NSDate, weight: Double)
    // cancel
    func dataViewControllerDidCancel(dataViewController:DataViewController)
}

class DataViewController: UIViewController {
    
    //When we change our property through code (and viewDidLoad didn't call we want to do this so we don't get stale data
    var weight: Double? {
        didSet{
            if let weight = weight {
                WeightTextField?.text = "\(weight)"
            }
        }
    }
    var date: NSDate? {
        didSet {
            if let date = date {
                datePicker?.date = date
            }
        }
    }
    
    var delegate: DataViewControllerDelegate?
    
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DataViewControler.viewDidLoad")
        print(weight)

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
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // Exit Segue -- must name them! So you know which one got called
        
        if let dataViewController = segue.destinationViewController as? ViewController {
            let date = datePicker.date
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
            if let weight = numberFormatter.numberFromString(WeightTextField.text!)?.doubleValue {
                delegate?.dataViewController(self, didPickDate: date, weight: weight)
            } else {
                delegate?.dataViewControllerDidCancel(self)
            }
        }
    }

}
