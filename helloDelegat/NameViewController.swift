//
//  NameViewController.swift
//  helloDelegat
//
//  Created by Максим Зыкин on 03.01.2023.
//

import UIKit

protocol NameDelegate {
    func nameField(name: String)
}

class NameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var delegate: NameDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 10
    }

    @IBAction func doneButtonAction(_ sender: Any) {
        if delegate != nil {
            if nameTextField != nil {
                let data = nameTextField.text
                delegate?.nameField(name: data!)
                dismiss(animated: true)
            }
        }
    }
}
