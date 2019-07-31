//
//  SubjectSchedule.swift
//  HomeEdu
//
//  Created by Minh Mon on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class SubjectSchedule: Mappable {
    
    var name: String?
    var date: String?
    var start: Int?
    var room: String?
    var id: Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        date <- map["date"]
        start <- map["start"]
        room <- map["room"]
        id <- map["id"]
    }
}
