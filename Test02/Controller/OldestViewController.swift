//
//  OldestViewController.swift
//  Test02
//
//  Created by Erikson Daniel Pérez Márquez on 7/4/19.
//  Copyright © 2019 EDPM. All rights reserved.
//

import UIKit
import CoreData

class OldestViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let person = Person()
        var ageOldest: Int = -1
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                if ageOldest < (data.value(forKey: "age") as! Int){
                    ageOldest = (data.value(forKey: "age") as? Int)!
                    person.firstName = data.value(forKey: "firstName") as? String
                    person.lastName = (data.value(forKey: "lastName") as! String)
                    person.age = data.value(forKey: "age") as? Int
                }
            }
            firstNameLabel.text = person.firstName
            lastNameLabel.text = person.lastName
            ageLabel.text = String(person.age!)
        } catch {
            print("Failed")
        }
 
        super.viewWillAppear(animated)
    }
    
}
