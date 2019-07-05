//
//  ListViewController.swift
//  Test02
//
//  Created by Erikson Daniel Pérez Márquez on 7/4/19.
//  Copyright © 2019 EDPM. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UITableViewController {
    
    var people: [Person] = []

    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        people = []
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                let person = Person()
                person.firstName = data.value(forKey: "firstName") as? String
                person.lastName = data.value(forKey: "lastName") as? String
                person.age = data.value(forKey: "age") as? Int
                people.append(person)
                //print(data.value(forKey: "firstName")!)
                print(data.value(forKey: "lastName")!)
                print(data.value(forKey: "age")!)
            }
        } catch {
            print("Failed")
        }
        
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PeopleCell
        
        
        cell.firstNameLabel.text = people[indexPath.row].firstName
        cell.lastNameLabel.text = people[indexPath.row].lastName
        cell.ageLabel.text = String(people[indexPath.row].age!)
        
        
        return cell
    }
    
    

}
