//
//  ScoreOfStudent.swift
//  HomeEdu
//
//  Created by Nguyen Cuong on 7/30/19.
//  Copyright © 2019 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ScoreOfStudent: UIViewController {
    @IBOutlet weak var View_tatca: UIView!
    @IBOutlet weak var View_quatrinh: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllScoreOfStudent()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Xemdiem(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            View_tatca.alpha = 0
            View_quatrinh.alpha = 1
        } else {
            View_tatca.alpha = 1
            View_quatrinh.alpha = 0
        }
    }
    func getAllScoreOfStudent(){
        let token: HTTPHeaders = [
            "Authorization" : "bearer " + SaveData.token]
        print(token)
        let url = "https://homedu.herokuapp.com/api/points"
        Alamofire.request(url, method: .get, parameters: [:], encoding: JSONEncoding.default, headers: token).responseJSON {(response) in
            switch response.result {
                case .success(let data):
                    let arrayJSON = JSON(data)
                    print(arrayJSON)
                case .failure(let error):
                    print(error)
            }
            
        }
    }
}
