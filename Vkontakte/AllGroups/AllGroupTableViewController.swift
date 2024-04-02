//
//  AllGroupsTableViewController.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    var allGroups: [Gru] = [.init(name: "qwe", imageName: "Arshavin", post1: [])]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //"ЧБД", "ДТП", "БашДТП", "Смс", "Приколы", "Книги", "ГУФ", "Фильмы", "Кино", "Юмор"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AGroupsTableViewCell.reuseIdentifier, for: indexPath) as! AGroupsTableViewCell

        let group = allGroups[indexPath.row]
        cell.configure(title: group.name, image: UIImage(systemName: "bolt"))
        return cell
    }
    
}
