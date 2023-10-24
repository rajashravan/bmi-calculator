//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var HeightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func HeightSliderChanged(_ sender: UISlider) {
        HeightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func WeightSliderChanged(_ sender: UISlider) {
        WeightLabel.text = String(Int(sender.value)) + "kg"
        
    }
    
    @IBAction func CalculatePressed(_ sender: UIButton) {
        let height:Float = heightSlider.value
        let weight: Float = weightSlider.value
        
        bmi = weight / pow(height, 2)
        print(String(bmi!))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        // how to do storyboard to storyboard
        // 1. create new storyboard
        // 2. use GUI to make new cocoa touch swift file. create viewController.
        // 3. use GUI to go into new storyboard view controller and attach new controller via right side panel
        // 4. CTRL drag first story board view controller to second view controller
        // 5. Click
        
    }
    
    // this is how you pass data between viewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = String(format: "%.1f", bmi!)
            
        }
    }
}

