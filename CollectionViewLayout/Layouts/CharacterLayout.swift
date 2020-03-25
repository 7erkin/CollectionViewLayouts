//
//  CharacterLayout.swift
//  CollectionViewLayout
//
//  Created by user166334 on 3/25/20.
//  Copyright © 2020 user166334. All rights reserved.
//

import UIKit

class CharacterLayout: UICollectionViewFlowLayout {
    private let maxScale: CGFloat = 1.2
    private let maxTransparent: CGFloat = 0.5
    var size: CGSize {
        return CGSize(width: 0.7 * collectionView!.bounds.width, height: 2 * collectionView!.bounds.height / 6)
    }
    
    override init() {
        super.init()
        minimumLineSpacing = 0.0
        minimumInteritemSpacing = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        let changingAttributesThreashold = size.height
        attributes!.forEach {
            let distanceToCenter = abs(collectionView!.bounds.midY - $0.center.y)
            let delta = (changingAttributesThreashold - distanceToCenter) / changingAttributesThreashold
            if delta < 0 {
                $0.zIndex = 1
                $0.size = size
                $0.alpha = maxTransparent
            } else {
                $0.zIndex = 5
                $0.size = size.scaled(by:  1 + delta * maxScale - delta)
                $0.alpha = (1 - maxTransparent * (1 - delta))
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
