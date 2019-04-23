//
//  PhotoRouter.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import Foundation

enum PhotoRouter {
    case list
}

extension PhotoRouter: Routable {
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "/list"
        }
    }
    
    var paramsJson: String? {
        switch self {
        case .list:
            return nil
        }
    }
    
    var paramsQueryString: [URLQueryItem]? {
        switch self {
        case .list:
            return nil
        }
    }
    
}
