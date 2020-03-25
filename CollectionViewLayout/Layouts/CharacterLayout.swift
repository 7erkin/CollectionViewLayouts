//
//  CharacterLayout.swift
//  CollectionViewLayout
//
//  Created by user166334 on 3/25/20.
//  Copyright © 2020 user166334. All rights reserved.
//

import UIKit

class CharacterLayout: UICollectionViewFlowLayout {
    private let maxScale: CGFloat = 0.9
    var size: CGSize {
        return CGSize(width: 0.7 * collectionView!.bounds.width, height: 2 * collectionView!.bounds.height / 6)
    }
    
    override init() {
        super.init()
        minimumLineSpacing = 20.0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        let distances = attributes?.map{ abs(collectionView!.bounds.midY - $0.center.y) }
        let minDistance = distances!.min()!
        let indexMinDistance = distances?.firstIndex(where: { $0 == minDistance })
        for (index, attr) in attributes!.enumerated() {
            if(index == indexMinDistance!) {
                attr.size = size.scaled(by: 1.1)
            } else {
                attr.size = size
            }
        }
        return attributes
    }
}

extension CGSize {
    func scaled(by scale: CGFloat) -> CGSize {
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
}
