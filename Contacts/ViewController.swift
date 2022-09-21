//
//  ViewController.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var contactsTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var usersList = [Users]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        searchBar.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let index = sender as? Int
        
        if segue.identifier == "toDetail"{
            
        }
        
        if segue.identifier == "toUpdate"{
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getInAllUsers()
    }
    func getInAllUsers(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).responseJSON { response in
            if let data = response.data{
                
                do{
                    let answer = try JSONDecoder().decode(UserModel.self, from: data)
                    if let inComingContactList = answer.kisiler{
                        self.usersList = inComingContactList
                    }else {
                        self.usersList = [Users]()
                    }
                     
                    
                    
                    DispatchQueue.main.async {
                        self.contactsTableView.reloadData()
                    }
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
        }
        }
    
    func doCall(doCall: String){
        
        let parameters : Parameters = ["kisi_ad": doCall]
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: parameters).responseJSON { response in
            if let data = response.data{
                
                do{
                    let answer = try JSONDecoder().decode(UserModel.self, from: data)
                    if let inComingContactList = answer.kisiler{
                        self.usersList = inComingContactList
                    }else{
                        self.usersList = [Users]()
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.contactsTableView.reloadData()
                    }
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
        }
        }
    
    func userDelete(userId: Int){
        
        let parameters : Parameters = ["kisi_id": userId ]
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: parameters).responseJSON { response in
            if let data = response.data{
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                        self.getInAllUsers()
                    }
                }
                
            catch{
                print(error.localizedDescription)
            }
            
        }
    }
}
          
    }


extension ViewController : UITableViewDelegate,UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = usersList[indexPath.row]
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCellTableViewCell
        cell.userTextLabel.text = "\(user.kisi_ad!) , \(user.kisi_tel!)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (UITableViewRowAction, indexPath : IndexPath) -> Void in
            
            let user = self.usersList[indexPath.row]
            
            if let userId = Int(user.kisi_id!){
                self.userDelete(userId: userId)
            }
            
            
        }
        let updateAction = UITableViewRowAction(style: .normal, title: "Update") { (UITableViewRowAction, indexPath : IndexPath) -> Void in
            
            self.performSegue(withIdentifier: "toUpdate", sender: indexPath.row)
        }
      
        
        return [deleteAction,updateAction]
    }
    
  
    
    
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("arama sonucu\(searchText)")
        
        doCall(doCall: searchText)
    }
}


