//
//  UserAddViewController.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import UIKit
import Alamofire

class UserAddViewController: UIViewController {
    
    @IBOutlet var userNumberTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func userAddButtonClicked(_ sender: UIButton) {
        
        if let name = userNameTextField.text , let tel = userNumberTextField.text{
            userAdd(userName: name, phoneNumber: tel)
        }
    }
    
    func userAdd(userName: String, phoneNumber:String){
        
        let parameters : Parameters = ["kisi_ad": userName , "kisi_tel":phoneNumber]
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: parameters).responseJSON { response in
            if let data = response.data{
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                    }
                }
                
            catch{
                print(error.localizedDescription)
            }
            
        }
    }
}
}
