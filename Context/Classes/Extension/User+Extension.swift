//
//  User+Extension.swift
//  Pods
//
//  Created by young on 2021/4/7.
//

import Foundation
import WYUtilCore

public protocol loginData {
    var user : WYTUserModel? { get }
}

public extension loginData {
    var user: WYTUserModel? {
        return WYTGlobal.shared.user
    }
}

//extension Base_Vc : loginData {
//
//}
