//
//  GroupsTableViewController.swift
//  1l_interface_Kanatev_Aleksey
//
//  Created by AlexMacPro on 21/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    public var myGroupsArray: [StructGroup] = []

    @IBAction func ExitToFirstScreen(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let allGroupsController = segue.source as! AllGroupsTableViewController
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
            let group = allGroupsController.filteredAllGroupsArray[indexPath.row]

                if !myGroupsArray.contains(group) {
                    myGroupsArray.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMyGroups", for: indexPath) as! MyGroupsTableViewCell
        let group = myGroupsArray[indexPath.row]
        cell.nameOfGroup.text = group.name
        cell.photoOfGroup.image = group.photo
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
