//
//  Extension.swift
//  FormDemo
//
//  Created by Disha on 9/19/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import  SVProgressHUD

typealias SuccessCompletionBlock = ((_ reponse : DataResponse<Any>) ->())
typealias ErrorCompletionBlock = ((_ reponse : DataResponse<Any>) ->())
typealias FailureCompletionBlock = ((String) ->())

extension UIViewController {
    
    public func callWebservice<T: BaseMappable>(URL:String?, httpMethod: HTTPMethod, Params:Parameters?,Header:[String:String]?, completion:@escaping (T) -> Void){
        guard NetworkConnectivity.isConnectedToInternet() else{
            self.view.showToast(toastMessage:.msgNetworkConnection, duration: 1.5)
            return
        }
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        //group.enter()
        Alamofire.request(URL!, method: httpMethod, parameters: Params, encoding: JSONEncoding.default, headers: Header).responseObject{ (response:DataResponse<T>) in
            //group.leave()
            //group.notify(queue: .main) {
            switch response.result {
            case .success(let value):
                completion(value)
                SVProgressHUD.dismiss()
                print(value)
            case .failure(let error):
                print(error)
                SVProgressHUD.dismiss()
            }
            //}
        }
    }
    
    public func callWebserviceArray<T: BaseMappable>(URL:String?, httpMethod: HTTPMethod, Params:Parameters?,Header:[String:String]?, completion:@escaping ([T]) -> Void){
        guard NetworkConnectivity.isConnectedToInternet() else{
            self.view.showToast(toastMessage:.msgNetworkConnection, duration: 1.5)
            return
        }
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        //group.enter()
        Alamofire.request(URL!, method: httpMethod, parameters: Params, encoding: JSONEncoding.default, headers: Header).responseArray {(response:DataResponse<[T]>) in
            //group.leave()
            //group.notify(queue: .main) {
            switch response.result {
            case .success(let value):
                completion(value)
                SVProgressHUD.dismiss()
                print(value)
            case .failure(let error):
                print(error)
                SVProgressHUD.dismiss()
            }
            //}
        }
    }
}

