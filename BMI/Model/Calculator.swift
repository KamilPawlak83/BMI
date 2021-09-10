//
//  Calculator.swift
//  BMI
//
//  Created by Kamil Pawlak on 26/04/2021.
//

import UIKit

struct Calculator {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmirounded = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmirounded
    }
    
    func getDescription() -> String {
        let description = bmi?.description ?? "No description"
        return description
    }
    
    func getColor() -> UIColor {
        let color = bmi?.color ?? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return color
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
         let bmiValue = weight / (height * height)
        
//        These values and descriptions are official in 2021. I added only word Excellent
        switch bmiValue {
        case 0..<16:  bmi = BMI(value: bmiValue, description: "Body mass deficit", color:  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 16..<18.5:  bmi = BMI(value: bmiValue, description: "Body weight deficit", color:  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        case 18.5..<25: bmi = BMI(value: bmiValue, description: "Norm. Excellent!", color: #colorLiteral(red: 0.1460172832, green: 0.6835722327, blue: 0.4439141452, alpha: 1))
        case 25..<30: bmi = BMI(value: bmiValue, description: "Weight over", color: #colorLiteral(red: 0.9764705896, green: 0.937817499, blue: 0.3153129118, alpha: 1))
        case 30..<35: bmi = BMI(value: bmiValue, description: "Obesity first degree", color: #colorLiteral(red: 0.9764705896, green: 0.6717864163, blue: 0.2248409406, alpha: 1))
        case 35..<40:  bmi = BMI(value: bmiValue, description: "Obesity second degree", color:  #colorLiteral(red: 0.9764705896, green: 0.4860020824, blue: 0.179739344, alpha: 1))
        case 40... :  bmi = BMI(value: bmiValue, description: "Obesity third degree", color:  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
            
        default: bmi = BMI(value: bmiValue, description: "Wrong Data", color:  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        
        }

    }
   
}
