//
//  Recipe.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 01/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation

struct Recipe : Codable {

    let chef : Chef?
    let description : String?
    let photo : Photo?
    let sys : Sys?
    let tagsCollection : TagsCollection?
    let title : String?


    enum CodingKeys: String, CodingKey {
        case chef
        case description = "description"
        case photo
        case sys
        case tagsCollection
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sys = try? values.decodeIfPresent(Sys.self, forKey: .sys)
        title = try? values.decodeIfPresent(String.self, forKey: .title)
        
        description = try? values.decodeIfPresent(String.self, forKey: .description)
  
        chef = try? values.decodeIfPresent(Chef.self, forKey: .chef)
        photo = try? values.decodeIfPresent(Photo.self, forKey: .photo)
        tagsCollection = try? values.decodeIfPresent(TagsCollection.self, forKey: .tagsCollection)
    }

}

struct Sys : Codable {

    let id : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
}

struct Photo : Codable {

    let url : String?


    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }


}

struct Chef : Codable {

    let name : String?


    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }


}

struct TagsCollection : Codable {

    let items : [Tag]?

    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([Tag].self, forKey: .items)
    }


}

struct Tag : Codable {

    let name : String?


    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }


}
