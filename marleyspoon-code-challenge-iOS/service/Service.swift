//
//  Service.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 01/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation
import Alamofire


class APIService {
    
    //private var alamofireManager: AF.SessionManager
    static private let url: String = "https://graphql.contentful.com/content/v1/spaces/kk2bw5ojx476?access_token=7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c"

    
    static private func headers() -> HTTPHeaders{
        var headers: HTTPHeaders = [:]
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        return headers
    }
    
    static func loadRecipes(parameters: QueryRecipes,
                            completion: @escaping (_ response: RecipesResponse) -> Void) {

        
    
        AF.request(url, method: .post, parameters: parameters.toDict(), encoding: JSONEncoding.default, headers: headers()).responseData { (response) in
            response.debugLog()

            switch response.result {
                case .success(let value):
                    if let content = try?  JSONDecoder().decode(RecipesResponse.self, from: value) {
                        completion(content)
                    }else{
                        completion(RecipesResponse( error: "unknow error"))
                    }
                case .failure(let error):
                    completion(RecipesResponse(error: error.errorDescription ?? "unknow error"))
                }
        }
    }
    
    
    static func loadRecipe(parameters: QueryRecipe,
                             completion: @escaping (_ response: RecipeResponse) -> Void) {

         
     
         AF.request(url, method: .post, parameters: parameters.toDict(), encoding: JSONEncoding.default, headers: headers()).responseData { (response) in
             response.debugLog()

             switch response.result {
                 case .success(let value):
                     if let content = try?  JSONDecoder().decode(RecipeResponse.self, from: value) {
                         completion(content)
                     }else{
                         completion(RecipeResponse( error: "unknow error"))
                     }
                 case .failure(let error):
                     completion(RecipeResponse(error: error.errorDescription ?? "unknow error"))
                 }
         }
     }
}
    
