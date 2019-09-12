//
//  MapperVC.swift
//  FormDemo
//
//  Created by Disha on 5/8/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import ShimmerSwift

class MapperVC: UIViewController {
    
    struct Section {
        var name: String?
        var items: [String]?
        var collapsed: Bool?
        
        init(name: String, items: [String], collapsed: Bool = false) {
            self.name = name
            self.items = items
            self.collapsed = collapsed
        }
    }

    var sections = [Section]()
    @IBOutlet weak var tblViewWeather: UITableView!
    var weatherResponse:WeatherResponse?
    var countryList:CountryList?
    var userList:UserDataCall?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getCountryDetails()

        callWebservice(URL:"https://thetool.ch/apiservices/public/api/v1/country/list", httpMethod: .get, Params: nil, Header: [:]) { ( response : CountryList) in
            self.countryList = response
            //print(self.userList?.completed)
            self.tblViewWeather.dataSource = self
            self.tblViewWeather.delegate = self
            self.tblViewWeather.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func makeSectionData(){
//
//        switch userList?.id {
//        case 1:
//            sections = [
//            Section(name: "UserId - 1", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        case 2:
//            sections = [
//            Section(name: "UserId - 2", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        case 3:
//            sections = [
//                Section(name: "UserId - 3", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//        case 4:
//            sections = [
//                Section(name: "UserId - 4", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        case 5:
//            sections = [
//                Section(name: "UserId - 5", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        case 6:
//            sections = [
//                Section(name: "UserId - 6", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//        case 7:
//            sections = [
//                Section(name: "UserId - 7", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        case 8:
//            sections = [
//                Section(name: "UserId - 8", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        case 9:
//            sections = [
//                Section(name: "UserId - 9", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//        case 10:
//            sections = [
//                Section(name: "UserId - 10", items: [String(userList?.id ?? 0), (userList?.title ?? "No Value")])
//            ]
//
//        default:
//            break
//        }
//        print(sections)
//    }
}

extension MapperVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (countryList?.data?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewWeather.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! tblMapCell
        let countryData = countryList?.data![indexPath.row]
        cell.lblLanguageCode.text = countryData?.language_code
        cell.lblCountryCode.text = countryData?.code
        cell.lblCountryName.text = countryData?.countryName
        return cell
    }
}

