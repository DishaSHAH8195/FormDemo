//
//  modelTest.swift
//  FormDemo
//
//  Created by Disha on 9/19/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import Foundation
import ObjectMapper

class CountryList: Mappable {
    var message: String?
    var data: [CountryData]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
    }
}

class CountryData: Mappable {
    var countryName : String?
    var code : String?
    var language_code : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        countryName <- map["country_name"]
        code <- map["code"]
        language_code <- map["language_code"]
    }
}
