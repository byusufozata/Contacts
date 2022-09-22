//
//  UserUpdateViewController.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import UIKit
import Alamofire

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
        
        if let u = user , let name = userNameTextField.text , let tel = userNumberTextField.text{
            if let uID = Int(u.kisi_id!){
                userUpdate(userId: uID , userName: name, phoneNumber:tel)
            }
    }
    
    func userUpdate(userId: Int, userName: String, phoneNumber:String){
        
        let parameters : Parameters = ["kisi_id": userId, "kisi_ad": userName , "kisi_tel":phoneNumber]
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: parameters).responseJSON { response in
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
}
