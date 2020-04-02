//
//  ViewController.swift
//  TimbreLayout
//
//  Created by user166334 on 4/2/20.
//  Copyright © 2020 user166334. All rights reserved.
//

import UIKit

struct Course {
    var name: String
    var shortDescription: String
    var picture: UIImage
}

class ViewController: UIViewController, UICollectionViewDataSource {
    var courses: [Course] = [
        .init(name: "City 1", shortDescription: "Some City 1 description", picture: UIImage(named: "Unknown-1")!),
        .init(name: "City 2", shortDescription: "Some City 2 description", picture: UIImage(named: "Unknown-2")!),
        .init(name: "City 3", shortDescription: "Some City 3 description", picture: UIImage(named: "Unknown-3")!),
        .init(name: "City 4", shortDescription: "Some City 4 description", picture: UIImage(named: "Unknown-4")!),
        .init(name: "City 5", shortDescription: "Some City 5 description", picture: UIImage(named: "Unknown-5")!)
    ]
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = self
            let layout = TimbreLayout()
            let itemWidth = self.collectionView.bounds.width
            let itemHeight = self.collectionView.bounds.height / 5
            layout.itemSize = .init(width: itemWidth, height: itemHeight)
            layout.minimumLineSpacing = 10.0
            self.collectionView.collectionViewLayout = layout
            self.collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let attributes: [NSAttributedString.Key:Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body, compatibleWith: nil).withSize(20)
        ]
        let attributedCourseName = NSAttributedString(string: courses[indexPath.row].name, attributes: attributes)
        let attributedCourseDescription = NSAttributedString(string: courses[indexPath.row].shortDescription, attributes: attributes)
        cell.courseNameLabel.attributedText = attributedCourseName
        cell.courseDescriptionLabel.attributedText = attributedCourseDescription
        cell.imageView.image = courses[indexPath.row].picture
        return cell
    }
}

