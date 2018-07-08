//
//  AddContactViewController.swift
//  ContactsApp
//
//  Created by Stuti on 07/07/18.
//  Copyright © 2018 Stuti. All rights reserved.
//

import UIKit


enum AddContactRows: Int {
    case Name = 0
    case Number = 1
}

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!    
    var addContactVM: AddContactViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        let barButtonSave = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(saveContact))
        let barButtonCancel = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelSavingContact))
        self.navigationItem.rightBarButtonItem = barButtonSave
        self.navigationItem.leftBarButtonItem = barButtonCancel
    }
    
    @objc func saveContact(){
        addContactVM.save()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelSavingContact(){
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension AddContactViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "textFieldCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AddContactTableViewCell
        
        cell.textField.tag = indexPath.row
        
        if cell.textField.tag == AddContactRows.Name.rawValue {
            cell.textField.placeholder = "Name"
            cell.textField.text = addContactVM.getName()
        }
        else if cell.textField.tag == AddContactRows.Number.rawValue {
            cell.textField.placeholder = "Number"
            cell.textField.text = addContactVM.getNumber()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



extension AddContactViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.tag == AddContactRows.Name.rawValue {
            addContactVM.saveName(name: textField.text!)
        }
        if textField.tag == AddContactRows.Number.rawValue {
            addContactVM.saveNumber(number: Int64(textField.text!)!)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        if textField.tag == AddContactRows.Number.rawValue {
//            let acceptableCharacters = "0123456789"
//            let mobileLength = 10
//            let cs = NSCharacterSet(charactersIn: acceptableCharacters).inverted
//            let filtered = string.components(separatedBy: cs).joined(separator: "")
//            return (string == filtered && (textField.text?.count)! < mobileLength)
//        }
//        return true
    }
    
    
}






