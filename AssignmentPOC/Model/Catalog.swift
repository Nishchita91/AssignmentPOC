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
    var rows : [CataloType]
    
    init(title: String?, rows: [CataloType]) {
        self.title = title
        self.rows = rows
    }
    
    static func saveCatalog(jsonObject: Data) -> [Catalog] {
        var data = [Catalog]()
        let list = try! JSONDecoder().decode(Catalog.self, from: jsonObject)
        let rowsObject = list.rows
        var rowsArray = [CataloType]()
        for object in rowsObject {
            let title = object.title
            let desc = object.description
            let imageUrl = object.imageUrl
            rowsArray.append(CataloType(title: title, description: desc, imageUrl: imageUrl))
        }
        let titleList = Catalog(title: list.title, rows: rowsArray)
        data.append(titleList)      
        return data
    }
}
struct CataloType : Codable {
    var title: String?
    var description: String?
    var imageUrl: String?
}
