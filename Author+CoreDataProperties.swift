//
//  Author+CoreDataProperties.swift
//  books-ios-app
//
//  Created by stagiaire on 03/05/2016.
//  Copyright © 2016 Nayed. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Author {

    @NSManaged var firstname: String?
    @NSManaged var lastname: String?
    @NSManaged var books: Book?

}
