//
//  PhotoProvider.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import Foundation
import RxSwift

protocol PhotoProviderProtocol: class {
    func fetchPhoto() -> Observable<[Photo]>
}

class PhotoProvider: PhotoProviderProtocol {
    
    private let disposeBag = DisposeBag()
    private let apiManager = ApiManager()
    
    func fetchPhoto() -> Observable<[Photo]> {
        return apiManager.request(router: PhotoRouter.list, type: [Photo].self)
    }
    
}
