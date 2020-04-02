//
//  TimbreLayout.swift
//  TimbreLayout
//
//  Created by user166334 on 4/2/20.
//  Copyright © 2020 user166334. All rights reserved.
//

import UIKit

class TimbreLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        print(collectionView!.contentOffset.y)
        if let layoutAttributes = super.layoutAttributesForElements(in: rect) {
            var copiedAttributes = [UICollectionViewLayoutAttributes]()
            for attributes in layoutAttributes {
                let copy = attributes.copy() as! UICollectionViewLayoutAttributes
                copy.frame = copy.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
                copy.transform = CGAffineTransform(rotationAngle: -14 * .pi / 180)
                copiedAttributes.append(copy)
            }
            return copiedAttributes
        }
        return nil
    }
}
