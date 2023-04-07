//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitStepper: UIStepper!
    var pct : Double = 0.1
    var numberOfPeople: Int = 2
    var totalBill: String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitStepper.maximumValue = 12
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        switch sender.currentTitle {
        case "0%":
            pct = 0
        case "10%":
            pct = 0.1
        case "20%":
            pct = 0.2
        default :
            pct = 0.1
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        numberOfPeople = Int(sender.value)
        splitNumber.text = String(format: "%.0f" ,sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let textBill = billTextField.text
        let bill: String = textBill ?? "0"
        totalBill = String(format : "%.2f" , (Double(bill) ?? 0.0) * (1 + pct) / Double(numberOfPeople))
        print(totalBill)
        
        self.performSegue(withIdentifier: "billTransfer", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "billTransfer"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = totalBill
            destinationVC.split = Int(splitStepper.value)
            destinationVC.tip = pct * 100
            
            
        }
    }
}

