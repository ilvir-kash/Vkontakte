//
//  MyGroup1CollectionViewController.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 20.03.2024.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyGroup1CollectionViewController: UICollectionViewController {

    var posts1: [Post1] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts1.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyGroup1CollectionViewCell.reuseID, for: indexPath) as! MyGroup1CollectionViewCell
        let post1 = posts1[indexPath.row]
        cell.iconImageView.image = .init(named: post1.imageName)
        cell.labelView.text = post1.text
        
        cell.iconImageView.layer.cornerRadius = 50
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
