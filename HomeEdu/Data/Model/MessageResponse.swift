//
//  MessageResponse.swift
//  HomeEdu
//
//  Created by Minh Mon on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class MessageResponse: Mappable {
    
    var message: String?
    var data: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
    }
    
}
