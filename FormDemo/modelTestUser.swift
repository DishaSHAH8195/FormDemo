//
//  modelTestUser.swift
//  FormDemo
//
//  Created by Disha on 10/9/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class UserDataCall : Mappable {
    var userId : Int?
    var id : Int?
    var title : String?
    
    required init?(map: Map) {
        
    }

     func mapping(map: Map) {
        userId <- map["UserId"]
        id <- map["Id"]
        title <- map["Title"]
    }
}

