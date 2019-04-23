//
//  EmptyView.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EmptyView: UIView {

    @IBOutlet weak var iconEmptyImageView: UIImageView!
    @IBOutlet weak var emptyMessageLabel: UILabel!
    
    private var clickEvent = PublishSubject<Void>()
    
    func setup(text: String, image: UIImage?) {
        self.emptyMessageLabel.text = text
        self.emptyMessageLabel.textColor = UIColor.App.charcoal
//        self.iconEmptyImageView.image = image
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EmptyView.iconEmptyTapped))
        self.iconEmptyImageView.isUserInteractionEnabled = true
        self.iconEmptyImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func iconEmptyTapped() {
        self.clickEvent.onNext(())
    }
    
    func getEventTappped() -> Observable<Void> {
        return clickEvent.asObservable()
    }
    
}
