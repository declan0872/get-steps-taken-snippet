//
//  ViewController.swift
//  get-steps-taken-snippet
//
//  Created by Declan on 12/06/2019.
//  Copyright © 2019 Declan Conway. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    //Create instance of CMPedometer library
    let pedometer = CMPedometer()
    let activityManager = CMMotionActivityManager()
    
    var globalRandomNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                                
            //Check if the device is able to count steps i.e does it have the motion coprocessor
            if CMPedometer.isStepCountingAvailable() {
                let calendar = Calendar.current

                pedometer.queryPedometerData(from: calendar.startOfDay(for: Date()), to: Date()) { (data, error) in
                    print("Number of steps taken \(String(describing: data?.numberOfSteps))")
                }

                pedometer.startUpdates(from: Date()) { (data, error) in
                    print(data?.numberOfSteps)
                    
                    let num: Int = 5
                    
                    // self.globalRandomNumber = data?.numberOfSteps as! Int
                    self.globalRandomNumber = num
                    
                    self.doLabelChange()
                    
                }

            }
    }
    
    
    func doLabelChange() {
        DispatchQueue.main.async {
            print("Called")
            self.testLabel.text = String(self.globalRandomNumber)
        }
    }
    
   
}

