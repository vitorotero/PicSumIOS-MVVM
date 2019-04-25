//
//  HomeViewController.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import UIKit
import IGListKit
import RxSwift

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private var viewModel: HomeViewModel!
    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    // MARK: - Life Cycle
    init(viewModel: HomeViewModel = HomeViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        prepareCollectionView()
        
        viewModel.fetchPhotos()
    }
    
    // MARK: - Private Methods
    private func bindView() {
        viewModel.photos
            .subscribe(onNext: { [weak self] photos in
                guard let self = self, !photos.isEmpty else { return }
                
                self.adapter.reloadData { _ in
                    self.adapter.performUpdates(animated: true)
                }
                
            })
            .disposed(by: disposeBag)
        
        viewModel.openDetailPhoto
            .subscribe(onNext: { [weak self] photo in
                guard let self = self, let photo = photo else { return }
                
                print(photo.author)
            })
            .disposed(by: disposeBag)
    }
    
    private func prepareCollectionView() {
        collectionView.backgroundColor = .clear
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
}

// MARK: - ListAdapterDataSource
extension HomeViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.viewModel.photos.value
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return HomeListSectionController(cellDelegate: self)
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: - HomeCollectionViewCellDelegate
extension HomeViewController: HomeCollectionViewCellDelegate {
    func openBrowser(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func didSelect(item: Photo) {
        viewModel.didSelected(photo: item)
    }
}
