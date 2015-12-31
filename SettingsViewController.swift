//
//  SettingsViewController.swift
//  Tip
//
//  Created by Chinedum Robert-Maduekwe on 12/26/15.
//  Copyright © 2015 nedu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTipControl: UISegmentedControl!
    @IBOutlet weak var ThemeSwitch: UISwitch!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var ThemeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        settingsTipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
    settingsTipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
       
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(ThemeSwitch.enabled, forKey: "ThemeSwitch")
    }
    
    
    
    @IBAction func defaultTipChanged(sender: AnyObject) {
    
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(settingsTipControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()

    }
    
    

    @IBAction func changeTheme() {
            if(ThemeSwitch.on){
                self.view.backgroundColor = UIColor.blackColor()
                TipLabel.textColor = UIColor.whiteColor()
                ThemeLabel.textColor = UIColor.whiteColor()
            }
            else {
                self.view.backgroundColor = UIColor(
                    red: 211,
                    green: 196/255.0,
                    blue: 253,
                    alpha: 1)
                TipLabel.textColor = UIColor.blackColor()
                ThemeLabel.textColor = UIColor.blackColor()
                
            }
            
            
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
