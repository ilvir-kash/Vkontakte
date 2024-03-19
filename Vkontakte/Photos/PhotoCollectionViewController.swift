//
//  PhotoCollectionViewController.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 16.03.2024.
//

import UIKit


class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView!.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reuseID)
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reuseID, for: indexPath) as! PhotosCollectionViewCell
        let post = posts[indexPath.row]
        cell.iconImageView.image = .init(named: post.imageName)
        cell.lableView.text = post.text
        
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
