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
    
   // var bmiValue = "0.0"
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
 
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
       // ewentualnie weightLabel.text = String(Int(sender.value))
        
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height1 = heightSlider.value
        let weight1 = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height1, weight: weight1)
        
        
        
        //let bmi = weight1 / (height1 * height1)
      //  bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController // Trzeba było to adcisnac jako ResultViewController poniewaz z tego poziomu nie było widać zmiennej bmiValue ktorej uzylismy poniezej
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advicekp = calculatorBrain.getAdvice()
            destinationVC.colorkp = calculatorBrain.getColor()
            
        }
    }
}


