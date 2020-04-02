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
    
    private var lineSpacing: CGFloat = 20.0
    override var minimumLineSpacing: CGFloat {
        get { return -0.5 * size.height }
        set { lineSpacing = newValue }
    }
    
    override init() {
        super.init()
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
            
            $0.zIndex = Int(1000 * 1 / abs(distanceToCenter + 1))
            if delta < 0 {
                //$0.size = size
                //let alpha = maxTransparent
            } else {
                //$0.size = size.scaled(by:  1 + delta * maxScale - delta)
                //let alpha = (1 - maxTransparent * (1 - delta))
                //$0.alpha = (1 - maxTransparent * (1 - delta))
            }
        }
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

extension CGSize {
    func scaled(by scale: CGFloat) -> CGSize {
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
}
