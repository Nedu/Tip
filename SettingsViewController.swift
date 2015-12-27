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
    
    @IBAction func defaultTipChanged(sender: AnyObject) {
    
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(settingsTipControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()

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
