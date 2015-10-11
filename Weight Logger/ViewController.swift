//
//  ViewController.swift
//  Weight Logger
//
//  Created by Chris Archibald on 10/9/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // This function let seqay back to this view.
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        print("ViewContoller.unwrapped")
    }
    
    // This function let us set up properties or setting
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dataViewController = segue.destinationViewController as? DataViewController {
            print("ViewController.preparing DataviewController")
            
            dataViewController.delegate = self
            //dataViewController.view.backgroundColor = UIColor.lightGrayColor()
            dataViewController.weight = 150.0
            dataViewController.date = NSDate(timeIntervalSinceNow: -60*60*24*3)
            
        }
    }
    
    //Delegate methods for DataViewController
    
    func dataViewController(dataViewController: DataViewController, didPickDate date: NSDate, weight: Double) {
        print("View Controller.dataviewController.didPIckDate")
    }
    
    func dataViewControllerDidCancel(dataViewController: DataViewController) {
        print("View Controller.dataview Controller.cancle")
    }
}


