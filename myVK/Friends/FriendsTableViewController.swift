//
//  FriendsTableViewController.swift
//  1l_interface_Kanatev_Aleksey
//
//  Created by AlexMacPro on 20/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate, UITextFieldDelegate {

    var peopleDictionary = [String: [String]]()
    var peopleSectionTitles = [String]()
    
    
    
    @IBOutlet var outletTableViewCell: FriendsTableViewCell!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Закрываем текстовое поле по нажатию Search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func setupSearchBar() {
        searchBar.delegate = self//Закрываем текстовое поле по нажатию Search
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredFriendsArray = friendsArray.filter({ (groupTMP) -> Bool in
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
    
    
    public var friendsArray: [StructPerson] = [
        StructPerson(name: "Александров Сергей", photo: UIImage(named: "1.png")),
        StructPerson(name: "Абрисова Жанна", photo: UIImage(named: "2.png")),
        StructPerson(name: "Абигайл Виктор", photo: UIImage(named: "3.png")),
        StructPerson(name: "Григорьева Евгения", photo: UIImage(named: "4.png")),
        StructPerson(name: "Дмитрич Татьяна", photo: UIImage(named: "5.png")),
        StructPerson(name: "Елабуга Максим", photo: UIImage(named: "6.png")),
        StructPerson(name: "Жордич Анастасия", photo: UIImage(named: "7.png")),
        StructPerson(name: "Занзибар Борис", photo: UIImage(named: "8.png")),
        StructPerson(name: "Ирвинов Аркадий", photo: UIImage(named: "9.png")),
        StructPerson(name: "Кислова Маргарита", photo: UIImage(named: "10.png")),
        StructPerson(name: "Лес Ярослав", photo: UIImage(named: "11.png")),
        StructPerson(name: "Мезинцева Яна", photo: UIImage(named: "12.png")),
        StructPerson(name: "Нолидж Мария", photo: UIImage(named: "13.png")),
        StructPerson(name: "Ордов Алексей", photo: UIImage(named: "14.png")),
        StructPerson(name: "Парашют Наталья", photo: UIImage(named: "15.png")),
        StructPerson(name: "Рыков Иван", photo: UIImage(named: "16.png"))]
    
    
    public var filteredFriendsArray: [StructPerson] = []
    
    @IBAction func extiToFirstScreenButton(_ sender: UIBarButtonItem) {
            self.dismiss(animated: true, completion: nil)
    }
    
    
    //done
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        filteredFriendsArray = friendsArray
        
        for person in friendsArray {
            let personKey = String(person.name.prefix(1))
            if var personValues = peopleDictionary[personKey] {
                personValues.append(person.name)
                
                peopleDictionary[personKey] = personValues
            } else {
                peopleDictionary[personKey] = [person.name]
            }
        }

        peopleSectionTitles = [String](peopleDictionary.keys)
        peopleSectionTitles = peopleSectionTitles.sorted(by: { $0 < $1 })

    }

    // MARK: - Table view data source

    //done
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return peopleSectionTitles
    }
    
    //done
    override func numberOfSections(in tableView: UITableView) -> Int {
        return peopleSectionTitles.count
        
    }

    //done
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let personKey = peopleSectionTitles[section]
        if let personValues = peopleDictionary[personKey] {
            return personValues.count
        }
        return 0
//        return  filteredFriendsArray.count
    }


    // working on
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell
        
//        let friend = filteredFriendsArray[indexPath.row]
//
//        cell.friendsLabel.text = friend.name
//        cell.photoView.image = friend.photo
//
        let personKey = peopleSectionTitles[indexPath.section]
        if let personValues = peopleDictionary[personKey] {
            cell.friendsLabel.text = personValues[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return peopleSectionTitles[section]
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            filteredFriendsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFriendInfo" {
            let friendVCController: FriendCollectionViewController = segue.destination as! FriendCollectionViewController
            let myFriendsController = segue.source as! FriendsTableViewController
            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
                let friend = myFriendsController.friendsArray[indexPath.row]
                friendVCController.currentFriend = friend
            }
        }
    }
}
