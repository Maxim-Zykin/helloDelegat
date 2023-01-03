//
//  NameViewController.swift
//  helloDelegat
//
//  Created by Максим Зыкин on 03.01.2023.
//

import UIKit

protocol NameDelegate {
    func nameField(name: String, dateOfBirth: String)
}

class NameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePicer: UIDatePicker!
    
    var delegate: NameDelegate? = nil
    var dateOfBirth = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 10
        datePicer.backgroundColor = .white

    }

    @IBAction func dateOfBirthAction(_ sender: Any) {
        let dateFormattor = DateFormatter()
        //dateFormattor.dateFormat = "dd-MM-yyyy 'at' HH:mm"
        dateFormattor.dateFormat = "dd.MM.yyyy"
        //dateFormattor.dateStyle = .full
        dateOfBirth = dateFormattor.string(from: datePicer.date)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        if delegate != nil {
            if nameTextField != nil {
                let data = nameTextField.text
                delegate?.nameField(name: data!, dateOfBirth: dateOfBirth)
                dismiss(animated: true)
            }
        }
    }
}
