//
//  ContactsListViewController.swift
//  ContactsApp
//
//  Created by Stuti on 07/07/18.
//  Copyright © 2018 Stuti. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnAddContact: UIButton!
    let contactListVM = ContactListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contactListVM.fetchArray()
        searchBar.placeholder = "\(contactListVM.numberOfContacts()) contacts"
    }
    
    func setUpUI() {
        self.navigationItem.title = "Contacts"
        btnAddContact.backgroundColor = UIColor.groupTableViewBackground
        btnAddContact.layer.cornerRadius = btnAddContact.layer.frame.size.width/2
    }
    
    @IBAction func btnAddContactClicked(_ sender: UIButton) {
        let addContactVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddContactViewController") as? AddContactViewController
        addContactVC?.addContactVM = AddContactViewModel()
        self.navigationController?.pushViewController(addContactVC!, animated: true)
    }
    
}

extension ContactsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactListVM.numberOfContacts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelImageCell", for: indexPath) as! ContactsListTableViewCell
        cell.lblName.text = contactListVM.contactNameAtIndex(for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddContactViewController") as? AddContactViewController
       let abc = AddContactViewModel(obj: contactListVM.contactAtIndex(for: indexPath.row))
        vc?.addContactVM = abc
//        vc?.addContactVM(obj: contactListVM.contactAtIndex(for: indexPath.row))
//        vc?.addContactVM.contactObj = contactListVM.contactAtIndex(for: indexPath.row)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


extension ContactsListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        
    }
    
    
    
}




