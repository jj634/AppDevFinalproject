//
//  File.swift
//  personaltrainer
//
//  Created by Jason Jung on 5/4/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Network {
    
    private static let endpoint = "http://52.15.253.2/routines"
    
    static func getRoutines(withQuery query: String, _ completion: @escaping ([Routine]) -> Void) {
        
        let parameters: Parameters = [:]
        
        Alamofire.request(endpoint, parameters: parameters).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json):
                
                let json = JSON(json)
                var routines: [Routine] = []
                
                for recipeJSON in json.arrayValue.prefix(9)  {
                    routines.append(Routine(from: recipeJSON))
                    print("appended")
                    print(routines)
                }
                
                completion(routines)
                
            case .failure(let error):
                print("[Network] Error:", error)
                completion([])
                
            }
            
            
        }
        
        //        parameters with user info
        
        
        
    }
    
    private static let endpoint1 = "http://52.15.253.2/users"


    static func postRoutines(withQuery query: [String], _ completion: @escaping ([Routine]) -> Void) {
        
        let parameters1: Parameters = [
            "Name": query[0],
            "Age": Int(query[1]),
            "Height": Int(query[2]),
            "Weight": Int(query[3]),
            "Gender": query[4]
            
            ]
        

        Alamofire.request(endpoint1, method: .post, parameters: parameters1, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json):
                
//                let json = JSON(json)
//                var routines: [Routine] = []
//
//                for recipeJSON in json.arrayValue.prefix(9)  {
//                    routines.append(Routine(from: recipeJSON))
//                    print("appended")
//                    print(routines)
//                }
                print("paramer")
                print(parameters1)
                print(response)
//                completion(routines)
                
            case .failure(let error):
                print("[Network] Error:", error)
                completion([])
                
            }
            
            
        }
        
        //        parameters with user info
        
        
        
    }
    
    static func deleteRoutines(withQuery query: String, _ completion: @escaping ([Routine]) -> Void) {
        
        let parameters1: Parameters = [
            :
            ]
        
        
        Alamofire.request(endpoint1, method: .delete, parameters: parameters1, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let json):
                
                //                let json = JSON(json)
                //                var routines: [Routine] = []
                //
                //                for recipeJSON in json.arrayValue.prefix(9)  {
                //                    routines.append(Routine(from: recipeJSON))
                //                    print("appended")
                //                    print(routines)
                //                }
                print("paramer")
                print(parameters1)
                //                completion(routines)
                
            case .failure(let error):
                print("[Network] Error:", error)
                completion([])
                
            }
            
            
        }
        
        //        parameters with user info
        
        
        
    }

}
