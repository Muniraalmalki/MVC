//
//  PeopleViewController.swift
//  MVC
//
//  Created by munira almallki on 12/03/1443 AH.
//

import UIKit

class PeopleViewController: UITableViewController {
    var people = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: {
             data, response, error in
                 do {
                     if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                         if let  results = jsonResult["results"]{
                             let resultArray = results as! NSArray
                             for item in resultArray{
                                 let resultsDictionary  = item as! NSDictionary
                                 self.people.append(resultsDictionary["name"] as! String)
                             }
                         }
                     }
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }
                 } catch {
                     print("Something went wrong")
                 }
         })
     }

        
    

    // MARK: - Table view data source

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
}
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellPeople", for: indexPath)
    cell.textLabel?.text = people[indexPath.row]
    return cell
}

}



