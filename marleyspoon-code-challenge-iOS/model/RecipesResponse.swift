//
//  RecipeResponse.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 01/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation



struct RecipesResponse : Codable  {
    
    let data : RecipeCollencionResponse?
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
        data = try? values.decodeIfPresent(RecipeCollencionResponse.self, forKey: .data)
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

struct RecipeCollencionResponse : Codable {

        let recipeCollection : RecipeCollection?

        enum CodingKeys: String, CodingKey {
                case recipeCollection = "recipeCollection"
        }
    
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            recipeCollection = try? values.decodeIfPresent(RecipeCollection.self, forKey: .recipeCollection)
        }

}

struct RecipeCollection : Codable {

        let items : [Recipe]?
        let total : Int?

        enum CodingKeys: String, CodingKey {
                case items = "items"
                case total = "total"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                items = try? values.decodeIfPresent([Recipe].self, forKey: .items)
                total = try? values.decodeIfPresent(Int.self, forKey: .total)
        }
    
        init() {
           items = nil
           total = 0
       }

}

struct Error : Codable {

    let extensions : Extension?
    let message : String?


    enum CodingKeys: String, CodingKey {
        case extensions
        case message = "message"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        extensions = try? values.decodeIfPresent(Extension.self, forKey: .extensions)
        message = try? values.decodeIfPresent(String.self, forKey: .message)
    }
    init(from message: String)  {
        self.message = message
        self.extensions = nil
    }

}

struct Extension : Codable {

    let contentful : Contentful?


    enum CodingKeys: String, CodingKey {
        case contentful
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        contentful = try? values.decodeIfPresent(Contentful.self, forKey: .contentful)
    }


}

struct Contentful : Codable {

    let code : String?
    let requestId : String?


    enum CodingKeys: String, CodingKey {
        case code = "code"
        case requestId = "requestId"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        requestId = try values.decodeIfPresent(String.self, forKey: .requestId)
    }


}
