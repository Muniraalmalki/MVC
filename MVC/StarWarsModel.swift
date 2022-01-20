//
//  StarWarsModel.swift
//  MVC
//
//  Created by munira almallki on 12/03/1443 AH.
//

import Foundation
//import Alamofire
class StarWarsModel {
  
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
     
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
      
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
       
        task.resume()
    }
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
     
        let url = URL(string: "https://swapi.dev/api/films/?format=json")
      
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
       
        task.resume()
    }
}
