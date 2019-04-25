//
//  HomeListSectionController.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 23/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import Foundation
import IGListKit

class HomeListSectionController: ListSectionController {
    
    private var object: Photo!
    private weak var cellDelegate: HomeCollectionViewCellDelegate!
    
    init(cellDelegate: HomeCollectionViewCellDelegate) {
        self.cellDelegate = cellDelegate
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 180)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HomeCollectionViewCell",
                                                                bundle: nil,
                                                                for: self,
                                                                at: index)
            as? HomeCollectionViewCell else { fatalError() }
        cell.setup(with: cellDelegate, photo:object)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? Photo
    }
    
    override func didSelectItem(at index: Int) {
        self.cellDelegate.didSelect(item: object)
    }
}
