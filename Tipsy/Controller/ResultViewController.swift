//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Андрей Логвинов on 2/8/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingslabel: UILabel!
    var result: String = "0.0"
    var split: Int = 2
    var tip: Double = 10
    override func viewDidLoad() {
        totalLabel.text = result
        super.viewDidLoad()
        settingslabel.text = "Split between \(split) people, with \(tip)% tip."
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
