//
//  ViewController.swift
//  Tip
//
//  Created by Chinedum Robert-Maduekwe on 12/26/15.
//  Copyright © 2015 nedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    
    var groupSize = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tip Calculator"
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tippingDefault = defaults.integerForKey("default_tip_percentage")
        tipControl.selectedSegmentIndex = tippingDefault
        
        self.onEditingChanged(self)
    }
    
    @IBAction func groupSlider(sender: UISlider) {
        groupSize = Int(sender.value)
        groupLabel.text = "\(groupSize)"
        
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage/Double(groupSize)
        let total = (billAmount + tip)/Double(groupSize)
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    }
    

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage/Double(groupSize)
        let total = (billAmount + tip)/Double(groupSize)
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
   
    }

}

