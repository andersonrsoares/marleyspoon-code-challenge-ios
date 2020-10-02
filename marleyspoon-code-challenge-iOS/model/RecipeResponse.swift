//
//  RecipeResponse.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 02/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation



struct RecipeResponse : Codable  {
    
    let data : RecipeData?
    var errors : [Error]?
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case errors = "errors"
    }

    
   var message: String {
       if let e = errors {
           return e.compactMap({ $0.message }).joined(separator: "\n")
       } else {
           return ""
       }
   }
   

   init(from decoder: Decoder) throws {
       let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try? values.decodeIfPresent(RecipeData.self, forKey: .data)
        errors = try? values.decodeIfPresent([Error].self, forKey: .errors)
     
   }
   
   init() {
       self.errors = nil
       self.data = nil
   }
    
    init(error:String) {
        self.errors = []
        self.errors?.append(Error(from: error))
        self.data = nil
    }
}

struct RecipeData : Codable {

        var recipe : Recipe?

        enum CodingKeys: String, CodingKey {
            case recipe = "recipe"
        }
    
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            recipe = try? values.decodeIfPresent(Recipe.self, forKey: .recipe)
        }

}

