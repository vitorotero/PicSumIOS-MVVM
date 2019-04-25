//
//  Photo.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import Foundation
import IGListKit

class Photo: Codable {
    
    var id: Int = 0
    var format: String = ""
    var fileName: String = ""
    var author: String = ""
    var authorUrl: String = ""
    var postUrl: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case format = "format"
        case fileName = "filename"
        case author = "author"
        case authorUrl = "author_url"
        case postUrl = "post_url"
    }
}

extension Photo: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? Photo else { return false }
        return id == object.id
    }
}
