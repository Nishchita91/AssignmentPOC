//
//  Catalog.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import Foundation

struct Catalog : Codable {
    var title : String!
    var rows : [CatalogType]
    
    init(title: String?, rows: [CatalogType]) {
        self.title = title
        self.rows = rows
    }
    
    static func saveCatalog(jsonObject: Data) -> [Catalog] {
        var data = [Catalog]()
        let list = try! JSONDecoder().decode(Catalog.self, from: jsonObject)
        let rowsObject = list.rows
        var rowsArray = [CatalogType]()
        for object in rowsObject {
            let title = object.title
            let desc = object.description
            let imageUrl = object.imageHref
            rowsArray.append(CatalogType(title: title, description: desc, imageHref: imageUrl))
        }
        let titleList = Catalog(title: list.title, rows: rowsArray)
        data.append(titleList)      
        return data
    }
}
struct CatalogType : Codable {
    var title: String?
    var description: String?
    var imageHref: String?
}
