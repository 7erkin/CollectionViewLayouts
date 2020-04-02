//
//  CollectionViewCell.swift
//  TimbreLayout
//
//  Created by user166334 on 4/2/20.
//  Copyright © 2020 user166334. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var courseDescriptionLabel: UILabel!
    @IBOutlet var imageViewContainerWidthConstraint: NSLayoutConstraint!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewContainer: UIView!
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        imageViewContainer.transform = CGAffineTransform(rotationAngle: 14 * .pi / 180)
        imageViewContainerWidthConstraint.constant = layoutAttributes.frame.minX + layoutAttributes.frame.maxX
    }
}
