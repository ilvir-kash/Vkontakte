//
//  MyGroupsTableViewController.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    var groups1: [Gru] = [
        .init(
            name: "NR",
            imageName: "nr1",
            post1: [
                .init(text: "про рэп", imageName: "nr2"),
                .init(text: "новинки", imageName: "nr3")]),
        .init(
            name: "MDK",
            imageName: "mdk1",
            post1: [
                .init(text: "новые посты", imageName: "mdk2"),
                .init(text: "новинки", imageName: "mdk3")])
    ]
    
    //["NR", "MDK", "Ufa", "Rabota"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBSegueAction func actionGroupDetails(_ coder: NSCoder) -> MyGroup1CollectionViewController? {
        let vc = MyGroup1CollectionViewController(coder: coder)
        guard let indexRow = tableView.indexPathForSelectedRow?.row else {
            return nil
        }
        vc?.posts1 = groups1[indexRow].post1
        return vc
    }
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == "AddGroup",
              let sourceController = segue.source as? AllGroupsTableViewController,
              let index = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        
        let group = sourceController.allGroups[index.row]
        
//        if !groups.contains(group){
//            groups.append(group)
//        }
        
        tableView.reloadData()
    }
    @IBSegueAction func tapUsers(_ coder: NSCoder, sender: Any?) -> MyGroup1CollectionViewController? {
        let vc = MyGroup1CollectionViewController (coder: coder)
        guard let indexRow = tableView.indexPathForSelectedRow?.row else {
            return nil
        }
        vc?.posts1 = groups1[indexRow].post1
        return vc
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups1.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reuseIdentifier, for: indexPath) as! GroupsTableViewCell

        
        let grup = groups1[indexPath.row]
        cell.configure(gr: grup)
        return cell

//        let group = groups[indexPath.row]
//        cell.configure(title: group, image: UIImage(systemName: "bolt"))
//        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
            groups1.remove(at: indexPath.row) 
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade) }
    }
}
