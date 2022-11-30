//
//  RandomViewController.swift
//  Randomizer
//
//  Created by Konstantin Losev on 30.11.2022.
//

import UIKit

class RandomViewController: UIViewController {

    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var lastNumberLabel: UILabel!
    @IBOutlet weak var resultNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNumberLabel.text = "1"
        lastNumberLabel.text = "100"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settings" {
            let setVC = segue.destination as! SettingsViewController
            setVC.firstNumber = firstNumberLabel.text
            setVC.lastNumber = lastNumberLabel.text
        }
    }
    
    @IBAction func getResultButton() {
        guard let first = Int(firstNumberLabel.text!) else { return }
        guard let last = Int(lastNumberLabel.text!) else { return }
        comparisonRange(first, last)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        let setVC = segue.source as! SettingsViewController
        if setVC.firstNumberTextField.text != "" {
            firstNumberLabel.text = setVC.firstNumberTextField.text
        }
        if setVC.lastNumberTextField.text != "" {
            lastNumberLabel.text = setVC.lastNumberTextField.text
        }
    }
    
    private func comparisonRange(_ numberOne: Int, _ numberTwo: Int) {
        if numberOne < numberTwo {
            resultNumberLabel.font = .systemFont(ofSize: 65)
            resultNumberLabel.text = String(calculateResult(first: numberOne, last: numberTwo))
        } else {
            resultNumberLabel.font = .systemFont(ofSize: 40)
            resultNumberLabel.text = "The first number must be greater than the second"
        }
    }
    
    private func calculateResult(first: Int, last: Int) -> Int {
        let range = first...last
        return range.randomElement()!
    }
}
