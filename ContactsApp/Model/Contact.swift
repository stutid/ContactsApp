//
//  ContactsModel.swift
//  ContactsApp
//
//  Created by Stuti on 07/07/18.
//  Copyright © 2018 Stuti. All rights reserved.
//

import Foundation
import CoreData

extension Contact {
    
    class func saveDataInDB(for obj: Contact) {
        
        let context = CoreDataStack.sharedInstance.backgroundQueueContext
        let myContact = Contact(context: context)
        myContact.name = obj.name
        myContact.number = obj.number
        do {
            try context.save()
        }
        catch {
            print("Error while saving data in core data")
        }
    }
    
    
    class func fetchData() -> [Contact]? {
        let context = CoreDataStack.sharedInstance.mainQueueContext
        let request: NSFetchRequest<Contact> = NSFetchRequest(entityName: "Contact")
        do {
            let result = try context.fetch(request)
            return result
        }
        catch {
            print("Error while fetching data from core data")
        }
        return nil
    }
    
}
