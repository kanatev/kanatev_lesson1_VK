//
//  AllGroupsTableViewController.swift
//  myVK
//
//  Created by AlexMacPro on 25/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Закрываем текстовое поле по нажатию Search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func setupSearchBar() {
        searchBar.delegate = self//Закрываем текстовое поле по нажатию Search
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredAllGroupsArray = allGroupsArray.filter({ (groupTMP) -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty { return true }
                return groupTMP.name.lowercased().contains(searchText.lowercased())
            default:
                return false
            }
        })
        
        tableView.reloadData()
    }
    
    public var allGroupsArray: [StructGroup] = [StructGroup(name: "Apple", photo: UIImage(named: "Apple.png")), StructGroup(name: "Студенты GeekBrains", photo: UIImage(named: "GeekBrains.png")), StructGroup(name: "Гусь", photo: UIImage(named: "Goose.png")), StructGroup(name: "Arduino fans", photo: UIImage(named: "Arduino.png")), StructGroup(name: "Наука сегодня", photo: UIImage(named: "Science.png")), StructGroup(name: "Путешествия", photo: UIImage(named: "Travel.png")), StructGroup(name: "Стимпанк рулит", photo: UIImage(named: "Steampunk.png"))]
    
    public var filteredAllGroupsArray: [StructGroup] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        filteredAllGroupsArray = allGroupsArray

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredAllGroupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAllGroups", for: indexPath) as! AllGroupsTableViewCell

        let group = filteredAllGroupsArray[indexPath.row]
        cell.nameOfGroup.text = group.name
        cell.photoOfGroup.image = group.photo

        return cell
    }
    
}
