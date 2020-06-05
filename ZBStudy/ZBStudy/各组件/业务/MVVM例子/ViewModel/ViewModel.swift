//
//  ViewModel.swift
//  MoyaDemo
//
//  Created by sungrow on 2017/2/23.
//  Copyright © 2017年 sungrow. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    func login(username: String, pwd: String) -> Observable<LoginModel> {
        return APIServiceProvider.rx.request(.login(username: username, pwd: pwd))
            .filterSuccessfulStatusCodes()
            .mapJSON().asObservable()
            .showAPIErrorToast()
            .mapObject(type: LoginModel.self)
    }
    
    func video() -> Observable<VideoModel> {
        return APIServiceProvider.rx.request(.video)
            .filterSuccessfulStatusCodes()
            .mapJSON().asObservable()
            .showAPIErrorToast()
            .mapObject(type: VideoModel.self)
    }
}
