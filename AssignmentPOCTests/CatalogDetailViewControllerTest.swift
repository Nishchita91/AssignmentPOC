//
//  CatalogDetailViewControllerTetst.swift
//  AssignmentPOCTests
//
//  Created by Nishchita on 09/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import XCTest

@testable import AssignmentPOC
class CatalogDetailViewControllerTest: XCTestCase {

    var catalogDetailVc = CatalogDetailViewController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _ = catalogDetailVc.view
        catalogDetailVc.loadView()
        catalogDetailVc.viewDidLoad()
        catalogDetailVc.didReceiveMemoryWarning()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailVcOutlets() {
        XCTAssertNotNil(catalogDetailVc.descriptionLabel, "not nil")
        XCTAssertNotNil(catalogDetailVc.imageview, "not nil")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
