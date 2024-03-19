//
//  FriendsTableViewCell.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendsTableViewCell"
    
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(human: Human) {
        titleCell.text = human.name
        imageViewCell.image = .init(named: "\(human.imageName)")
    }
}
