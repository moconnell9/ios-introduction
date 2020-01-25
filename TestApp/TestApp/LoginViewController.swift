//
//  SecondViewController.swift
//  TestApp
//
//  Created by Oconnell, Madeline on 1/24/20.
//  Copyright © 2020 Oconnell, Madeline. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private var passwordValue = ""
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        passwordField.delegate = self                  //set delegate to textfile
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        if let text = textField.text {
            passwordValue = text
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length == 1 { //user pressed backspace
            passwordValue = String(passwordValue.dropLast())
        } else {
            passwordValue += string
            if let displayText = textField.text, !displayText.isEmpty {
                textField.text = displayText.dropLast() + "•"
            }
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        return true
    }
}


