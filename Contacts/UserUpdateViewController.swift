//
//  UserUpdateViewController.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import UIKit

class UserUpdateViewController: UIViewController {

    @IBOutlet var userNumberTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    
    var user : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = user {
        
            userNameTextField.text = u.kisi_ad
            userNumberTextField.text = u.kisi_tel
            
        }
    }
    
    @IBAction func userUpdateButtonClicked(_ sender: UIButton) {
    }
    
}
