//
//  MyFriendsTableViewController.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {

    var friends: [Human] = [
        .init(
            name: "Аршавин",
            imageName: "Arshavin",
            post: [
                .init(text: "Матч 2020", imageName: "AR1"),
                .init(text: "Матч dfdkjkjk 2020", imageName: "AR2"),
                .init(text: "Матч 2020666667", imageName: "AR3"),
                .init(text: "Матч 2022", imageName: "AR1")
            ]
        ),
        .init(name: "Петров", imageName: "petrov", post: [.init(text: "Первые пробы", imageName: "PR1")])
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBSegueAction func tapUsers(_ coder: NSCoder, sender: Any?) -> PhotoCollectionViewController? {
        let vc = PhotoCollectionViewController(coder: coder)
        guard let indexRow = tableView.indexPathForSelectedRow?.row else {
            return nil
        }
        vc?.posts = friends[indexRow].post
        return vc
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseIdentifier, for: indexPath) as! FriendsTableViewCell

        let friend = friends[indexPath.row]
        cell.configure(human: friend)
        return cell
    }
  


}
