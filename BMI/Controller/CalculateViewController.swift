//
//  ViewController.swift
//  BMI
//
//  Created by Kamil Pawlak on 26/04/2021.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet var calculateButton: UIButton!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.applyDesign()
        weightSlider.value = 100.0
        
        // only for first use height is equal to 1.10m in other cases height takes last chosen value
        let defaults = UserDefaults.standard
        let savedHeight = defaults.float(forKey: "MyHeight")
        heightSlider.value = savedHeight
        
        if heightSlider.value == 0 {
            heightSlider.value = 1.10
        } else {
            heightLabel.text = "\(savedHeight) m"
        }
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
 
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = round(heightSlider.value * 100) / 100
        let weight = round(weightSlider.value)
        calculator.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        // I save User's height because this value doesn't change very often
        let defaults = UserDefaults.standard
        defaults.set(height, forKey: "MyHeight")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValueRVC = calculator.getBMIValue()
            destinationVC.descriptionRVC = calculator.getDescription()
            destinationVC.colorRVC = calculator.getColor()
            
        }
    }
    
}
// this extension allowed me to change property of Buttons
extension UIButton {
   func applyDesign() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
}
}

