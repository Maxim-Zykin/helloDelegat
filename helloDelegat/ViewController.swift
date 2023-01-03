//
//  ViewController.swift
//  helloDelegat
//
//  Created by Максим Зыкин on 03.01.2023.
//

import UIKit

class ViewController: UIViewController, NameDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    func nameField(name: String, dateOfBirth: String) {
        nameLabel.text = "Hello, \(name)!"
        dateLabel.text = "Birthday: \(dateOfBirth)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeButton.layer.cornerRadius = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nameText" {
            let newVC = segue.destination as? NameViewController
            newVC?.delegate = self
        }
    }

}

