//
//  HomeCollectionViewCell.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbTeste: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with photo: Photo) {
        lbTeste.text = photo.author
    }

}
