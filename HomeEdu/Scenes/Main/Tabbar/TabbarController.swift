//
//  TabbarController.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/26/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let homeduSocket = HomeduSocket.shared
        homeduSocket.configSocket()
        getExamSchedule()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func getExamSchedule() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWNjZXNzIjp0cnVlLCJtZXNzYWdlIjoiTG9hZGVkIGFjY291bnQiLCJkYXRhIjpbeyJfaWQiOiI1ZDM2YWNmYzU1ODkxNDFhM2EwNTI1ODQiLCJ1c2VybmFtZSI6IjE2MDIyNDExIiwicGFzc3dvcmQiOiIkMmEkMTAkLnNCZzJ1WThOSTRBRlJCMkpIbW5kLnFLQlJCd0xjWXpsc2NVQkNjQUNQc1FMTjlkdTZsd3kiLCJzdHVkZW50X2lkIjoiMTYwMjI0MTEiLCJiaXJ0aGRheSI6IjE5OTgtMDMtMDFUMTc6MDA6MDAuMDAwKzAwOjAwIiwic2V4IjoiTmFtIiwiZnVsbG5hbWUiOiJQaMOtIFbEg24gTWluaCIsImVtYWlsIjoiMTYwMjI0MTFAdm51LmVkdS52biIsIm90aGVyX2VtYWlsIjoicGhpdmFubWluaDEwQGdtYWlsLmNvbSIsInByb2dyYW1fdHlwZSI6IkPhu60gbmjDom4iLCJjbGFzcyI6IlFILTIwMTYtaS9DUS1DLUEtQ0xDMiIsIm5hdGlvbiI6IlZp4buHdCBOYW0iLCJhZGRyZXNzIjoiVFAuIEjDoCBO4buZaSJ9XSwiaWF0IjoxNTYzOTUzODU5fQ.20y-qTNKD7j8QCSuW6Vj_BM5H_MSCu64nLV8AAi41h0"
        ]

        Alamofire.request("http://homedu.herokuapp.com/api/exam", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<ExamResponse>) in
            
            if let examResponse = response.result.value {
                if let success = examResponse.success {
                    print(success)
                }
                
                if let message = examResponse.message {
                    print(message)
                }
                
                if let data = examResponse.data {
                    let examSchedule = data[0]
                    if let studentId = examSchedule.studentId {
                        print(studentId)
                    }
                    if let examSchedules = examSchedule.examSchedule {
                        for subjectSchedule in examSchedules {
                            print(subjectSchedule)
                        }
                    }
                }
            }
            
        }
    }
    
    func setup(){
        let taikhoan = Storyboards.Taikhoan
        let lichthi = Storyboards.Lichthi
        let tkb = Storyboards.Tkb
        let xemdiem = Storyboards.Xemdiem
        let about = Storyboards.About
        
        let taikhoan_controller = taikhoan.instantiateViewController(withIdentifier: "taikhoan")
        let lichthi_controller = lichthi.instantiateViewController(withIdentifier: "lichthi")
        let tkb_controller = tkb.instantiateViewController(withIdentifier: "tkb")
        let xemdiem_controller = xemdiem.instantiateViewController(withIdentifier: "xemdiem")
        let about_controller = about.instantiateViewController(withIdentifier: "about")

        xemdiem_controller.tabBarItem = UITabBarItem(title: "Xem điểm", image: nil, tag: 0)
        tkb_controller.tabBarItem = UITabBarItem(title: "TKB", image: nil, tag: 1)
        taikhoan_controller.tabBarItem = UITabBarItem(title: "Tài khoản", image: nil, tag: 2)
        lichthi_controller.tabBarItem = UITabBarItem(title: "Lịch thi", image: nil, tag: 3)
        about_controller.tabBarItem = UITabBarItem(title: "About", image: nil, tag: 4)
        self.viewControllers = [xemdiem_controller, tkb_controller, taikhoan_controller, lichthi_controller, about_controller]
        
    }
    


}
