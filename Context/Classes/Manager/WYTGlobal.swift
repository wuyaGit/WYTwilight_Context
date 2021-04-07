//
//  WYTGlobal.swift
//  Pods
//
//  Created by young on 2021/4/7.
//

import Foundation
import SwiftyUserDefaults
import UtilCore
import NetWorkCore
import Alice
import RxSwift
import Alamofire

extension DefaultsKeys {
    /// 缓存用户的主键id
    static let userid = DefaultsKey<String>("com.bella.userid", defaultValue: "")
    //缓存token
    static let token = DefaultsKey<String>("com.bella.token", defaultValue: "")
    
    static let userName = DefaultsKey<String>("com.bella.username", defaultValue: "")
    
    static let password = DefaultsKey<String>("com.bella.password", defaultValue: "")
    
    static let isRember = DefaultsKey<Bool>("com.bella.isrember", defaultValue: false)
}

public struct WYTGlobal {
    public static var shared = WYTGlobal()
    private var disposeBag = DisposeBag()
    private init() { }
    
    public var user: User_Model?
    
    ///更新用户信息
    public static func updateUserModel(_ user:User_Model) -> Void {
        WYTGlobal.shared.user = user
        Defaults[.userid] = user.userid
        Defaults[.token] = user.token
        updateToken()
        /// 发送退出通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Envs.notificationKey.loginSuccess), object: user)
    }
    
    /// 更新token
    public static func updateToken() {
        if let user = WYTGlobal.shared.user {
            NetWorkAPI.sharedInstance.headers["token"] = user.token
        }
    }
    
    /// 退出登录 ， 清空用户信息
    public static func logout() {
        WYTGlobal.shared.user  = nil
        Defaults.remove(.userid)
        Defaults.remove(.token)
        NetWorkAPI.sharedInstance.headers.removeValue(forKey: "token")
        /// 发送退出通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Envs.notificationKey.logoutSuccess), object: nil)
    }
    
    public static func isRember() -> Bool {
        return Defaults[.isRember]
    }
    
    public static func updateIsRember( _ isRember:Bool) {
        Defaults[.isRember] = isRember
    }
    
    public static func userName() -> String {
        return Defaults[.userName]
    }
    
    public static func updateUserName( _ userName:String) {
        Defaults[.userName] = userName
    }
    
    public static func password() -> String {
        return Defaults[.password]
    }
    
    public static func updatePassword( _ password:String) {
        Defaults[.password] = password
    }
    
    //在发起通过token获取用户对象之前，读取本地缓存的token然后更新header中的token
    static func updateHeaderTokenFromCache () {
        if let user = WYTGlobal.shared.user {
            NetWorkAPI.sharedInstance.headers["token"] = user.token
        } else {
            let token = Defaults[.token]
            if token.length > 0 {
                NetWorkAPI.sharedInstance.headers["token"] = token
            }
        }
    }
    
    //根据缓存的token更新用户对象
    public func updateUserFromService () {
        WYTGlobal.updateHeaderTokenFromCache()
        Observable.just(GlobalApi.correctionuser)
            .emeRequestApiForObj(User_Model.self)
            .subscribe(onNext: { (result) in
                switch result {
                case .success(let user):
                    //登陆成功就更新上下文中的登陆对象
                    Global.updateUserModel(user)
                case .failure(_): break}
            })
            .disposed(by: disposeBag)
    }
}

public enum WYTGlobalApi {
    
    /// 根据token校正客户端的用户对象
    case correctionuser
}

extension WYTGlobalApi: TargetType {
    
    //请求路径
    public var path: String {
        switch self {
        case .correctionuser:
            return "user/correctionuser"
        }
    }
    
    //设置请求方式 get post等
    public var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    /// 设置请求参数
    public var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
}
