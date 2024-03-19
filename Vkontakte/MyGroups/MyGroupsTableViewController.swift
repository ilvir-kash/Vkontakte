//
//  MyGroupsTableViewController.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 13.03.2024.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    var groups = ["NR", "MDK", "Ufa", "Rabota"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == "AddGroup",
              let sourceController = segue.source as? AllGroupsTableViewController,
              let index = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        
        let group = sourceController.allGroups[index.row]
        
        if !groups.contains(group){
            groups.append(group)
        }
        
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reuseIdentifier, for: indexPath) as! GroupsTableViewCell


        let group = groups[indexPath.row]
        cell.configure(title: group, image: UIImage(systemName: "bolt"))
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
            groups.remove(at: indexPath.row) 
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade) }
    }
}
