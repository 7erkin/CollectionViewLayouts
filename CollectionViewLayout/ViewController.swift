//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by user166334 on 3/25/20.
//  Copyright © 2020 user166334. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = self
        }
    }
    private var numbers = Array(0...11)
    private var colors: [UIColor] = [.green, .red, .blue, .gray, .purple, .orange, .green, .red, .blue, .gray, .purple, .orange]
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGSize(width: 0.7 * collectionView!.bounds.width, height: 2 * collectionView!.bounds.height / 6)
        let layout = collectionView.collectionViewLayout as! CharacterLayout
        layout.estimatedItemSize = size
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.number.text = "\(numbers[indexPath.row])"
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout

}
