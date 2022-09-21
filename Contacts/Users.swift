//
//  Users.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import Foundation

class Users: Codable {
    var kisi_id : String?
    var kisi_ad : String?
    var kisi_tel : String?
    
    init(kisi_id : String,kisi_ad : String, kisi_tel : String){
        self.kisi_ad = kisi_ad
        self.kisi_id = kisi_id
        self.kisi_tel = kisi_tel
    }
    
}
