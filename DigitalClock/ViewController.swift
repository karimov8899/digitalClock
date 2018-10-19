//
//  ViewController.swift
//  DigitalClock
//
//  Created by Dave on 03.10.2018.
//  Copyright © 2018 DaKar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var clockBgSeg: UISegmentedControl!
    @IBOutlet weak var clockColorSeg: UISegmentedControl!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsLabel: UIButton!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        settingsView.isHidden = true
        settingsView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func settings(_ sender: Any) {
        
        if settingsView.isHidden == true {
            settingsView.isHidden = false
            settingsLabel.setTitle("Hide Settings", for: UIControlState.normal)
             
        } else  {
            settingsView.isHidden = true
            settingsLabel.setTitle("Settings", for: UIControlState.normal)
        }
        
    }
    
    @IBAction func clockColor(_ sender: Any) {
        if (clockColorSeg.selectedSegmentIndex == 0 ) {
            label.textColor = UIColor.white
        }
        if (clockColorSeg.selectedSegmentIndex == 1 ) {
            label.textColor = UIColor.black
        }
        if (clockColorSeg.selectedSegmentIndex == 2 ) {
            label.textColor = UIColor.red
        }
        if (clockColorSeg.selectedSegmentIndex == 3 ) {
            label.textColor = UIColor.green
        }
    }
    
    @IBAction func backgroundColor(_ sender: Any) {
        if (clockBgSeg.selectedSegmentIndex == 0) {
            self.view.backgroundColor = UIColor.black
        }
        if (clockBgSeg.selectedSegmentIndex == 1) {
            self.view.backgroundColor = UIColor.yellow
        }
        if (clockBgSeg.selectedSegmentIndex == 2) {
            self.view.backgroundColor = UIColor.white
        }
        if (clockBgSeg.selectedSegmentIndex == 3) {
            self.view.backgroundColor = UIColor.blue
        }
    }
    
    @objc  func updateTimer() {
        let timeFormater = DateFormatter()
        
        timeFormater.timeStyle = .medium
        label.text = timeFormater.string(from: Date())
    }
}

