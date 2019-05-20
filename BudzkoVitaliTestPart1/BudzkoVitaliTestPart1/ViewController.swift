//
//  ViewController.swift
//  BudzkoVitaliTestPart1
//
//  Created by Sasha Dubikovskaya on 20.05.2019.
//  Copyright © 2019 BudzkoVitaliTestPart1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var text: UITextField!
    
    var isTapped = false
    
    var numberArray = [Int]()
    
    @IBOutlet weak var table: UITableView!

    @IBAction func button(_ sender: Any) {
        
        numberArray = [Int]()
        
        if text.text != "" {
            if let x = Int(text.text!) {
                label.isHidden = true

                numberArray = [Int]()
                let nextArray = fibonacciA(number: abs(x))
    
                for i in 0...abs(x) {
                    for element in nextArray {
                        if i == element {
                            numberArray.append(i)
                        }
                    }
                }
            } else {
                label.isHidden = false
                label.text = "Please, write correct number."
            }
        }
        isTapped = true
        table.reloadData()
    }
    
    func fibonacciA(number: Int) -> [Int] {
        var fibArray = [Int]()
        fibArray.append(0)
        fibArray.append(1)
        for i in 2...number {
            fibArray.append(fibArray[i-1]+fibArray[i-2])
        }
        return fibArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if isTapped {
        cell.textLabel?.text = String(numberArray[indexPath.row] * numberArray[indexPath.row])
        } else {
            cell.textLabel?.text = ""
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

