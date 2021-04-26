//
//  CalculatorBrain.swift
//  BMI
//
//  Created by Kamil Pawlak on 26/04/2021.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmizaokraglone = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmizaokraglone
    }
    
    func getAdvice() -> String {
        let advicekp = bmi?.advice ?? "No Advise"
        return advicekp
    }
    
    func getColor() -> UIColor {
        let colorkp = bmi?.color ??  #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return colorkp
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
         let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more", color:  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Greate result", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "STOP eating", color:  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }


    }
    //let bmi = weight1 / (height1 * height1)
  //  bmiValue = String(format: "%.1f", bmi)
    
}
