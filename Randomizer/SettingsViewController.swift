//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Konstantin Losev on 30.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var lastNumberTextField: UITextField!
    
    var firstNumber: String!
    var lastNumber: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        settingTextField()
    }
    
    @IBAction func cancelButton() {
        dismiss(animated: true)
    }
    
    private func settingTextField() {
        firstNumberTextField.clearButtonMode = .whileEditing
        lastNumberTextField.clearButtonMode = .whileEditing
        
        firstNumberTextField.keyboardType = .decimalPad
        lastNumberTextField.keyboardType = .decimalPad
        
        firstNumberTextField.placeholder = "Enter first number"
        lastNumberTextField.placeholder = " Enter last number"
        
        firstNumberTextField.text = firstNumber
        lastNumberTextField.text = lastNumber
    }
}
