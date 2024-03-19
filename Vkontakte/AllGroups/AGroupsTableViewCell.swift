//
//  AGroupsTableViewCell.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class AGroupsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "AGroupsTableViewCell"
    
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(title: String?, image: UIImage?){
        titleCell.text = title
        imageViewCell.image = image
    }
    
}
