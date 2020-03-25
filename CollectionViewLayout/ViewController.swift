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
    private var numbers = Array(0...20)
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.number.text = "\(numbers[indexPath.row])"
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout

}
