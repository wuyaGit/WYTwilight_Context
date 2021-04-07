//
//  ContextCore.swift
//  Pods
//
//  Created by young on 2021/4/7.
//

import Foundation


/// 本模块的名称， 本模块的storyboard 名称必须 与模块名称相同 ,已经用于静态资源的加载回用到
let modularName = "Context"

public class ContextCore {
    
    public static var sharedInstance :  ContextCore {
        struct Static {
            static let instance :  ContextCore =  ContextCore()
        }
        return Static.instance
    }
    
    ///供其他模块使用
    public static var bundle:Bundle?{
        get{
            guard let bundleURL = Bundle(for: ContextCore.self).url(forResource: modularName, withExtension: "bundle") else {
                return nil
            }
            guard let bundle = Bundle(url: bundleURL) else {
                return nil
            }
            return bundle
        }
    }
}

