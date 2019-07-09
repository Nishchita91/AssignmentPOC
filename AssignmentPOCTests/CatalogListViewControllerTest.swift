//
//  CatalogListViewControllerTest.swift
//  AssignmentPOCTests
//
//  Created by Nishchita on 09/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import XCTest

@testable import AssignmentPOC
class CatalogListViewControllerTest: XCTestCase {

    var catalogVc = CatalogListViewController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        _ = catalogVc.view
        catalogVc.loadView()
        catalogVc.viewDidLoad()
        catalogVc.listTableView.reloadData()
        catalogVc.didReceiveMemoryWarning()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       
    }
    
    func testViewHasTableView() {
        XCTAssertNotNil(catalogVc.listTableView)
    }
    
    func testTableViewHasDelegateDataSource() {
        XCTAssertNotNil(catalogVc.listTableView.dataSource)
        XCTAssertNotNil(catalogVc.listTableView.delegate)
    }
    
    func testListTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(catalogVc.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(catalogVc.responds(to: #selector(catalogVc.tableView(_:didSelectRowAt:))))
    }
    
    func testListTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(catalogVc.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(catalogVc.responds(to: #selector(catalogVc.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(catalogVc.responds(to: #selector(catalogVc.tableView(_:cellForRowAt:))))
    }
    
    func testCatalogListApiData() {
        let expectionObj = expectation(description: "CatalogList Service Initiated")
        RequestAdapter.shared.getCatalogList(endPointUrl: catalogListURL) { (error, catalogObject) -> (Void) in
           debugPrint("Catalog Service Executed")
            debugPrint("Catalog data success: \(self.catalogVc.catalogList)")
            expectionObj.fulfill()
        }
        waitForExpectations(timeout: 8, handler: nil)
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
