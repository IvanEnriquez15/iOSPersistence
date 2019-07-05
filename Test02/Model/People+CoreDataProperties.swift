//
//  People+CoreDataProperties.swift
//  Test02
//
//  Created by Erikson Daniel Pérez Márquez on 7/4/19.
//  Copyright © 2019 EDPM. All rights reserved.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int16

}
