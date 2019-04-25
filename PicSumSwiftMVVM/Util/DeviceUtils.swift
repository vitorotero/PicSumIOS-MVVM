//
//  File.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 25/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import UIKit

final class DeviceUtils {
    
    static func openBrowser(in url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
