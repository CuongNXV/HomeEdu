//
//  ExamSchedule.swift
//  HomeEdu
//
//  Created by Minh Mon on 7/31/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import Foundation
import ObjectMapper

class ExamSchedule: Mappable {
    var studentId: String?
    var examSchedule: [SubjectSchedule]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        studentId <- map["student_id"]
        examSchedule <- map["exam_schedule"]
    }
}
