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
    var arrContactsData = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        
        self.navigationItem.title = "Contacts"
        arrContactsData = Contact.fetchData()!
        searchBar.placeholder = "\(arrContactsData.count) contacts"
        btnAddContact.backgroundColor = UIColor.groupTableViewBackground
        btnAddContact.layer.cornerRadius = btnAddContact.layer.frame.size.width/2
    }
    
    @IBAction func btnAddContactClicked(_ sender: UIButton) {
        let addContactVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddContactViewController")
        self.navigationController?.pushViewController(addContactVC, animated: true)
    }
    
}

extension ContactsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContactsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelImageCell", for: indexPath) as? ContactsListTableViewCell
        cell?.lblName.text = arrContactsData[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


extension ContactsListViewController: UISearchBarDelegate {
    
    
    
    
    
}




