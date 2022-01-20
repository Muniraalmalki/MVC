//
//  FilmsViewController.swift
//  MVC
//
//  Created by munira almallki on 12/03/1443 AH.
//

import UIKit

class FilmsViewController: UITableViewController {

    var Films = [String]()
        override func viewDidLoad() {
            super.viewDidLoad()
            StarWarsModel.getAllFilms(completionHandler:  {
                       
                        data, response, error in
                        
                        do {
                            
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                print(jsonResult)
                            
                               if let  results = jsonResult["results"]{
                                   let resultArray = results as! NSArray
                                    for item in resultArray{
                                        let resultsDictionary  = item as! NSDictionary
                                        self.Films.append(resultsDictionary["title"] as! String)
                                    }
                                   print(self.Films)
                            }
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print(error)
                        }
                    })
          

                }
        
      
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Films.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFilm", for: indexPath)
            cell.textLabel?.text = Films[indexPath.row]
            return cell
        }

}



