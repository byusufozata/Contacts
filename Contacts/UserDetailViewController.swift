//
//  UserDetailViewController.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import UIKit



class UserDetailViewController: UIViewController {

    @IBOutlet var userNumberLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    var user : Users?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = user {
            userNameLabel.text = u.kisi_ad
            userNumberLabel.text = u.kisi_tel
        }

        
    }
    


}
