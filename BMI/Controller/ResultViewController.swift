//
//  ResultViewController.swift
//  BMI
//
//  Created by Kamil Pawlak on 26/04/2021.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValueRVC: String?
    var descriptionRVC: String?
    var colorRVC: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet var recalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateButton.applyDesign()
        bmiLabel.text = bmiValueRVC
        adviceLabel.text = descriptionRVC
        view.backgroundColor = colorRVC
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

