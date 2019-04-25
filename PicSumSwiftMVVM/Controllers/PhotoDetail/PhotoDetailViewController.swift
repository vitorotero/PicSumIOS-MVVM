//
//  PhotoDetailViewController.swift
//  
//
//  Created by VitorOtero on 25/04/19.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var authorUrlButton: UIButton!
    
    // MARK: - Properties
    private var photo: Photo!
    
    // MARK: - Life Cycle
    init(photo: Photo) {
        super.init(nibName: nil, bundle: nil)
        self.photo = photo
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.title = photo.author
        
        authorLabel.text = photo.author
        authorLabel.font = .systemFont(ofSize: 16)
        authorLabel.textColor = UIColor.App.primaryDark
        authorLabel.textAlignment = .center
        
        postButton.setTitle(R.string.localizable.photoDetailPostButtonText(), for: .normal)
        postButton.setTitleColor(.black, for: .normal)
        postButton.backgroundColor = UIColor.App.primary
        postButton.layer.cornerRadius = 8
        
        authorUrlButton.setTitle(R.string.localizable.photoDetailAuthorButtonText(), for: .normal)
        authorUrlButton.setTitleColor(.black, for: .normal)
        authorUrlButton.backgroundColor = UIColor.App.primary
        authorUrlButton.layer.cornerRadius = 8
        
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.kf.indicatorType = .activity
        photoImageView.kf.setImage(with: URL(string: "\(Constants.basePhotoUrl)\(photo.id)"))
    }
    
    // MARK: - Actions
    @IBAction func postButtonTapped(_ sender: Any) {
        DeviceUtils.openBrowser(in: photo.postUrl)
    }
    
    @IBAction func authorUrlButtonTapped(_ sender: Any) {
        DeviceUtils.openBrowser(in: photo.authorUrl)
    }
}
