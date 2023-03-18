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
        
        if let name = UserDefaults.standard.value(forKey: Keys.name),
           let date = UserDefaults.standard.value(forKey: Keys.dateOfBirth) {
            nameLabel.text = name as? String
            dateLabel.text = date as? String
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nameText" {
            let newVC = segue.destination as? NameViewController
            newVC?.delegate = self
        }
    }

}

