//
//  Reachability.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/21/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import Foundation
import Alamofire

class Reachability {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
