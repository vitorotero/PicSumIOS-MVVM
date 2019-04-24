//
//  HomeCollectionViewCell.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import UIKit
import Kingfisher

protocol HomeCollectionViewCellDelegate: class {
    func openBrowser(url: String)
}

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private weak var delegate: HomeCollectionViewCellDelegate!
    private var photo: Photo!
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var authorUrlButton: UIButton!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.kf.indicatorType = .activity
        
        authorLabel.font = .systemFont(ofSize: 13)
        authorLabel.textColor = .white
        
        authorUrlButton.contentHorizontalAlignment = .left
        authorUrlButton.setTitleColor(UIColor.App.linkTextBlue, for: .normal)
    }
    
    func setup(with delegate: HomeCollectionViewCellDelegate, photo: Photo) {
        self.delegate = delegate
        self.photo = photo
        
        photoImageView.kf.setImage(with: URL(string: "https://picsum.photos/1920/1080?image=\(photo.id)"))
        authorLabel.text = photo.author
        authorUrlButton.setTitle(photo.authorUrl, for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func authorUrlButtonTapped(_ sender: Any) {
        delegate.openBrowser(url: photo.authorUrl)
    }
}
