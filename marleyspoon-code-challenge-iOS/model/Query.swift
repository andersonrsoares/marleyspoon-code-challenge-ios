//
//  Query.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 01/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import Foundation


class Query  {
    var query: String?
    var variables: [String:Any]?
    
    func toDict() ->  [String:Any] {
        var dict = [String:Any]()
        dict["query"] = query
        dict["variables"] = variables
        return dict
    }
}


class QueryRecipes: Query  {
    
    
    init(skip:Int = 0, limit:Int = 100) {
        super.init()
        self.variables = [String:Any]()
        self.variables?["skip"] = skip
        self.variables?["limit"] = limit
        
        self.query = "query RecipeCollection($skip: Int!, $limit: Int!){\n" +
            "  recipeCollection(skip: $skip,limit:$limit){\n" +
            "    total,\n" +
            "    items{\n" +
            "      \tsys{\n" +
            "          id\n" +
            "        }\n" +
            "      \ttitle,\n" +
            "      \tphoto{\n" +
            "          url\n" +
            "        }\n" +
            "      }\n" +
            "    }\n" +
            "}"
    }
}

class QueryRecipe: Query  {
    
    
    init(id:String) {
        super.init()
        self.variables = [String:Any]()
        self.variables?["id"] = id
        
        self.query = "query recipe($id: String!){\n" +
        "  recipe(id: $id){\n" +
        "\t\t\t\tchef{\n" +
        "          name\n" +
        "        }\n" +
        "        description\n" +
        "      \tsys{\n" +
        "          id\n" +
        "        }\n" +
        "      \ttitle,\n" +
        "      \tphoto{\n" +
        "          url\n" +
        "        }\n" +
        "      \ttagsCollection{\n" +
        "          items{\n" +
        "            name\n" +
        "          }\n" +
        "      }\n" +
        "    \n" +
        "  }\n" +
        "}"
    }
}
