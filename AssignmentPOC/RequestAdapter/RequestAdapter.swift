//
//  RequestAdapter.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import Foundation
import Alamofire

class RequestAdapter {
    
    static let shared = RequestAdapter()
    
    private init() {
    }
    
    // MARK: - Request to get Catalog List : HTTP Method - GET
    
    func getCatalogList(endPointUrl: String, completion: @escaping ResponseCompletionHandler) {
        let urlString = baseURL + endPointUrl
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseString
            { response in
                switch response.result
                {
                case .failure(let error):
                    if let data = response.data {
                        completion(error as NSError, nil)
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                    print(error)
                case .success(let jsonResponse):
                    if let jsonData = jsonResponse.data(using: .utf8) {
                        completion(nil, jsonData)
                    }
                }
        }
    }
    
}
