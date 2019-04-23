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

    private let disposeBag = DisposeBag()
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
//    private var refreshControl: UIRefreshControl!
//    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    // MARK: - Life Cycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.prepareCollectionView()
    }
    
    // MARK: - Private Methods
    private func prepareCollectionView() {
//        refreshControl = UIRefreshControl()
//        refreshControl.tintColor = .clear
//        refreshControl.addTarget(self, action: #selector(refreshValueChanged), for: .valueChanged)
//        collectionView.backgroundColor = .clear
//        collectionView.refreshControl = refreshControl
//        adapter.collectionView = collectionView
//        adapter.dataSource = self
    }
    
    // MARK: - Actions
//    @objc func refreshValueChanged(refreshControl: UIRefreshControl) {
//        refreshControl.endRefreshing()
////        self.doRefresh()
//    }

}

// MARK: - ListAdapterDataSource
//extension HomeViewController: ListAdapterDataSource {
//
//    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
//        return self.items
//    }
//
//    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        return HomeListSectionController()
//    }
//
//    func emptyView(for listAdapter: ListAdapter) -> UIView? {
//        let emptyView: EmptyView? = {
//            let view = R.nib.emptyView.instantiate(withOwner: nil)[firstArrayPosition] as? EmptyView
//            let message = consumptionType == ConsumptionTypeEnum.consumption
//                ? R.string.localizable.consumptionEmptyListConsumption()
//                : R.string.localizable.consumptionEmptyListDevolution()
//            view?.setup(text: message, image: #imageLiteral(resourceName: "ic_consumption_empty"))
//            return view
//        }()
//        return emptyView
//    }
//}

// MARK: - UIScrollViewDelegate
//extension HomeViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let reachedBottom = (scrollView.contentOffset.y + scrollView.frame.height == scrollView.contentSize.height)
//        if reachedBottom {
//            self.delegate.loadData(isRefresh: false, skip: self.items.count)
//        }
//    }
//}
