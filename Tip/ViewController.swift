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
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var BillAmount: UILabel!
    @IBOutlet weak var Tip: UILabel!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var Group: UILabel!
    
    var groupSize = 1
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tip Calculator"
        
        billField.becomeFirstResponder()
        
        let colors = defaults.integerForKey("colors")
        DefaultTheme(colors)

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
        
        let colors = defaults.integerForKey("colors")
        DefaultTheme(colors)
        
        let locale = NSLocale.currentLocale().localeIdentifier
        let universalLocale = NSLocale(localeIdentifier: locale)
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = universalLocale
        
        let billrestart = defaults.objectForKey("billrestart")
        if billrestart != nil {
            let current = NSDate.timeIntervalSinceReferenceDate()
            let change = current - (billrestart as! Double!)
            if change < (60 * 10) {
                let bill = defaults.objectForKey("bill")
                if bill != nil {
                    if bill as! Double! != 0 {
                        billField.text = String(bill)
                    }
                }
            }
        }
    }
    
    
    @IBAction func groupSlider(sender: UISlider) {
        groupSize = Int(sender.value)
        groupLabel.text = "\(groupSize)"
        
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage/Double(groupSize)
        let total = (billAmount + tip)/Double(groupSize)
        
        
        
        let locale = NSLocale.currentLocale().localeIdentifier
        let universalLocale = NSLocale(localeIdentifier: locale)
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = universalLocale
        
        
        tipLabel.text = String(currencyFormatter.stringFromNumber(tip)!)
        totalLabel.text = String(currencyFormatter.stringFromNumber(total)!)
    }
    
    func fadein(){
    self.bar.alpha = 0
    UIView.animateWithDuration(0.4, animations: {
    self.bar.alpha = 1
    })
}

    
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage/Double(groupSize)
        let total = (billAmount + tip)/Double(groupSize)
        
        let locale = NSLocale.currentLocale().localeIdentifier
        let universalLocale = NSLocale(localeIdentifier: locale)
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = universalLocale
        
        
        tipLabel.text = String(currencyFormatter.stringFromNumber(tip)!)
        totalLabel.text = String(currencyFormatter.stringFromNumber(total)!)
        
        
        
    }
    
    
    func DefaultTheme(value: Int)
    {
       if value == 1
        
       {
            self.view.backgroundColor = UIColor.blackColor()
            groupLabel.textColor = UIColor.whiteColor()
            BillAmount.textColor = UIColor.whiteColor()
            Tip.textColor = UIColor.whiteColor()
            Total.textColor = UIColor.whiteColor()
            Group.textColor = UIColor.whiteColor()

        

        }
        else if value == 0 {
            self.view.backgroundColor = UIColor(
                red: 211,
                green: 196/255.0,
                blue: 253,
                alpha: 1)
            groupLabel.textColor = UIColor.blackColor()
            BillAmount.textColor = UIColor.blackColor()
            Tip.textColor = UIColor.blackColor()
            Total.textColor = UIColor.blackColor()
            Group.textColor = UIColor.blackColor()
            
        }

        
    }
    
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
   
    }

}

