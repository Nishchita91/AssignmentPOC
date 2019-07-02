//
//  Constants.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import Foundation

public let baseURL: String = "https://dl.dropboxusercontent.com/"
public let catalogListURL: String = "s/2iodh4vg0eortkl/facts.json"
public typealias ResponseCompletionHandler = (_ error: NSError?, _ responseJSON: NSDictionary?) -> (Void)
