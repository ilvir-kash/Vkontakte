//
//  GroupsTableViewCell.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "GroupsTableViewCell"
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(gr:Gru) {
        titleCell.text = gr.name
        imageViewCell.image = .init(named: "\(gr.imageName)")
    }

}
