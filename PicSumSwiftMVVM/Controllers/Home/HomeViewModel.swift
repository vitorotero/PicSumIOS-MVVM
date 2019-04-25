//
//  HomeViewModel.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    private var photoProvider: PhotoProviderProtocol!
    private let disposeBag: DisposeBag = DisposeBag()
    
    var photos = BehaviorRelay<[Photo]>(value: [Photo]())
    var openDetailPhoto = BehaviorRelay<Photo?>(value: nil)
    
    init(photoProvider: PhotoProviderProtocol = PhotoProvider()) {
        self.photoProvider = photoProvider
    }
    
    func fetchPhotos() {
        photoProvider.fetchPhoto()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] photos in
                guard let self = self else { return }
                self.photos.accept(photos)
                }, onError: { _ in
                    
            })
            .disposed(by: disposeBag)
    }
    
    func didSelected(photo: Photo) {
        openDetailPhoto.accept(photo)
    }
    
}
