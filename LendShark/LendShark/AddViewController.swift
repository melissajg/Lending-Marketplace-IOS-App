//
//  AddViewController.swift
//  myFirebaseApp
//
//  Created by Muhammed Essa on 1/22/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController, UISheetPresentationControllerDelegate{
    
    let ref = Database.database().reference(withPath: "people")
    var items :[Person] = []
    
    @IBOutlet weak var tradeType: UISegmentedControl!
    @IBOutlet weak var nameTextEdit: UITextField!
    @IBOutlet weak var lastNameTextEdit: UITextField!
    @IBOutlet weak var ageEditText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet var addSheet: UIView!
    @IBAction func didTapSaveButton(_ sender: Any) {
        let addPerson = Person(name: nameTextEdit.text!, lname: lastNameTextEdit.text!, age: ageEditText.text!)
        let addPersonRef = self.ref.childByAutoId()
        addPersonRef.setValue(addPerson.toAnyObject())
        dismiss(animated: true)
    }
    
    // The cancel button was tapped.
    @IBAction func didTapCancelButton(_ sender: Any) {
        // Dismiss the TaskComposeViewController.
        dismiss(animated: true)
    }

}
