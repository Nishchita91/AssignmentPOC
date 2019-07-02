//
//  CatalogListViewController.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import UIKit

class CatalogListViewController: UIViewController {

    var listTableView = UITableView()
    var refreshControl = UIRefreshControl()
    var catalogList = [CataloType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getCatalogList()
    }
    
    // MARK: - Service Request

    func getCatalogList() {
        RequestAdapter.shared.getCatalogList(controller: self, endPointUrl: catalogListURL) { (error, jsonResponse) -> (Void) in
            if let data = jsonResponse {
                let catalogList = Catalog.saveCatalog(jsonObject: data)
                self.configureView(catalogList[0])
            }
        }
    }
    
    // MARK: - Configure UIView

    func configureView(_ catalog: Catalog) {
        self.title = catalog.title
    }
    func setUpTableview() {
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        listTableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight);
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(CatalogListTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(listTableView)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(doSomething), for: UIControl.Event.valueChanged)
        listTableView.addSubview(refreshControl)
    }
    @objc func doSomething(refreshControl: UIRefreshControl) {
        self.getCatalogList()
        refreshControl.endRefreshing()
    }


}
extension CatalogListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatalogListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
