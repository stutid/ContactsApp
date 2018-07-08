//
//  AddContactViewModel.swift
//  ContactsApp
//
//  Created by Stuti on 08/07/18.
//  Copyright © 2018 Stuti. All rights reserved.
//

import Foundation

class AddContactViewModel {
    
    var contactObj: Contact?
    
    convenience init(obj: Contact?) {
        self.init()
        self.contactObj = obj
    }

    func save() {
         Contact.saveDataInDB(for: contactObj!)
    }
    
    func getName() -> String? {
        return (contactObj?.name)
    }
    
    func getNumber() -> String? {
        return "\(contactObj?.number ?? 0)"
    }
    
    func getNameAndNumber(for obj: Contact) -> (String?, String?) {
        return (obj.name, String(describing: obj.number))
    }
    
    func saveName(name: String) {
        contactObj?.name = name
    }
    
    func saveNumber(number: Int64) {
        contactObj?.number = number
    }
    
}
