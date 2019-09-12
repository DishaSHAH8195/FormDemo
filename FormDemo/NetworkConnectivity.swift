//
//  NetworkConnectivity.swift
//
//
//  Created by Vishal Nandoriya on 2/21/18.
//  Copyright © 2018 Vishal Nandoriya. All rights reserved.
//

import Foundation
import Alamofire

class NetworkConnectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
