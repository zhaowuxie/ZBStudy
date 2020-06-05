//
//  OnekeyService.swift
//  operation4ios
//
//  Created by sungrow on 2017/2/17.
//  Copyright © 2017年 阳光电源股份有限公司. All rights reserved.
//

import Foundation
import Moya

let API_PRO = "http://120.25.226.186:32812"

let headerFields: [String: String] = ["system": "iOS","sys_ver": String(UIDevice.version())]
let publicParameters: [String: String] = ["language": "_zh_CN"]

let APIServiceProvider = MoyaProvider<CJAPIService>.init()


enum CJAPIService: TargetType {
    case login(username: String, pwd: String)
    case video
}

extension CJAPIService {
    
    var headers: [String : String]? {
        return [:]
    }
    
    var baseURL: URL {
        return URL(string: API_PRO)!
    }
    
    var path: String {
        switch self {
        case .login(username: _, pwd: _):
            return "/login"
        case .video:
            return "/video"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(username: _, pwd: _):
            return .get
        case .video:
            return .post
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .login(username: let username, pwd: let pwd):
            return ["username": username, "pwd": pwd]
        case .video:
            return ["type": "JSON"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}

private let endPointClosure = { (target: CJAPIService) -> Endpoint in
    let defaultEndpoint = MoyaProvider<CJAPIService>.defaultEndpointMapping(for: target)
    return defaultEndpoint.adding(newHTTPHeaderFields: headerFields)
}


