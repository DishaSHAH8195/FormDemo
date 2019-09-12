//
//  ViewController.swift
//  FormDemo
//
//  Created by Disha on 5/8/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var tblFromView: UITableView!
    
    var straddr = "If you’ve ever created custom table view cells before, chances are good that you have spent a lot of time sizing table view cells in code. You may even be familiar with having to manually calculate the height of every label,image view, text field, and everything else within the cell"
    var dicData = ["Email":"xyz@gmail.com","Phone No" :"123456789","Review" : "Good Application With Simple User interface"] as NSMutableDictionary
    var arrData : [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dicData.setValue(straddr, forKey: "Address")
        dicData.setValue(straddr, forKey: "Address1")
        dicData.setValue(straddr, forKey: "Address2")
        //dicData.setValue(straddr, forKey: "Address3")

        tblFromView.estimatedRowHeight = 200
        tblFromView.rowHeight = UITableViewAutomaticDimension
        tblFromView.delegate = self
        tblFromView.dataSource = self
        
        //set Name and company name
        lblName.text = "Disha Shah"
        lblCompanyName.text = "self Employeed"
        //imgProfile.image = UIImage(named:"yellowstar")
        
        //
        for (key, value) in dicData {
            arrData.append((key as! String, value as! String));
        }
        print(arrData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrData.count
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFromView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! tblFormCell
        
        let (key, value) = arrData[indexPath.row]; //read element for the desired cell
        cell.lblFormTitle.text = key
        cell.lblFormData.text = value
        return cell
    }
    }


//How to use Multipart demo

//func uploadFileWebCall(){
//    SVProgressHUD.setDefaultMaskType(.black)
//    SVProgressHUD.show()
//    var arrFilePath = [String]()
//    arrFilePath.append(saveImage(data: imageData)?.path ?? "")
//    let arrFiles = [[multiPartFieldName: "File",
//                     multiPartPathURLs: arrFilePath]]
//    MultiPart().callPostWebService(Constants.WebServiceURLs.uploadDriverFile, parameetrs: nil, filePathArr: arrFiles) { (dic, error) in
//        self.documents = Mapper<Documents>().map(JSON: dic ?? [:])
//        if self.documents?.uploadID != 0 {
//            SDImageCache.shared().clearMemory()
//            SDImageCache.shared().clearDisk()
//            SVProgressHUD.dismiss()
//            self.uploadDocWebCall()
//        }else{
//            SVProgressHUD.dismiss()
//        }
//        if (error == nil) {
//            print(error ?? "")
//        }
//    }
//}

