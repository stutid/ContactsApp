//
//  ContactListViewModel.swift
//  ContactsApp
//
//  Created by Stuti on 08/07/18.
//  Copyright © 2018 Stuti. All rights reserved.
//

import Foundation

class ContactListViewModel {
    
    private var arrContactsData = [Contact]()
    
    func fetchArray(){
        arrContactsData = Contact.fetchData()!
    }
    
    func numberOfContacts() -> Int {
        return arrContactsData.count
    }
    
    func contactNameAtIndex(for index: Int) -> String? {
        return arrContactsData[index].name
    }
    
    func contactAtIndex(for index: Int) -> Contact {
        return arrContactsData[index]
    }
    
}
