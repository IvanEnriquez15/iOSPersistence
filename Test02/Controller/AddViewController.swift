//
//  AddViewController.swift
//  Test02
//
//  Created by Erikson Daniel Pérez Márquez on 7/4/19.
//  Copyright © 2019 EDPM. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "People", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(firstNameTextField.text, forKey: "firstName")
        newEntity.setValue(lastNameTextField.text, forKey: "lastName")
        newEntity.setValue( Int(ageTextField.text!), forKey: "age")
        
        do {
            try context.save()
            print("saved")
            firstNameTextField.text = ""
            lastNameTextField.text = ""
            ageTextField.text = ""
        } catch {
            print("Failed saving")
        }
        
    }
    
}
