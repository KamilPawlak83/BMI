//
//  ResultViewController.swift
//  BMI
//
//  Created by Kamil Pawlak on 26/04/2021.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var advicekp: String?
    var colorkp: UIColor?
    
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = advicekp
        view.backgroundColor = colorkp
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

