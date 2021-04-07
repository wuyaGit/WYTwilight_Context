//
//  WYTUserModel.swift
//  Pods
//
//  Created by young on 2021/4/7.
//

import Foundation
import SwiftyJSON
import ModelProtocol

public class WYTUserModel: ModelProtocol {

   // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kuserIdKey: String = "id"
    internal let kuserCreatedAtKey: String = "createdAt"
    internal let kuserUpdatedAtKey: String = "updatedAt"
    internal let kuserUsernameKey: String = "username"
    internal let kuserPhoneKey: String = "phone"
    internal let kuserWechatKey: String = "wechat"
    internal let kuserEmailKey: String = "email"
    internal let kuserTokenKey: String = "token"
    internal let kuserUserTypeKey: String = "userType"

    // MARK: 属性

     public var userid: String
     public var createdAt: Int
     public var updatedAt: Int
     public var username: String
     public var phone: String
     public var wechat: String
     public var email: String
     public var token: String
     public var userType: Int

    // MARK: 实现MikerSwiftJSONAble 协议， 解析json数据
    public required  init?(json: JSON) {

        userid  = json[kuserIdKey].stringValue
        createdAt  = json[kuserCreatedAtKey].intValue
        updatedAt  = json[kuserUpdatedAtKey].intValue
        username  = json[kuserUsernameKey].stringValue
        phone  = json[kuserPhoneKey].stringValue
        wechat  = json[kuserWechatKey].stringValue
        email  = json[kuserEmailKey].stringValue
        token  = json[kuserTokenKey].stringValue
        userType  = json[kuserUserTypeKey].intValue

    }

}
