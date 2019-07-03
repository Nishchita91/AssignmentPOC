//
//  CatalogListViewController.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import UIKit
import MBProgressHUD

class CatalogListViewController: UIViewController {

    var listTableView = UITableView()
    var refreshControl = UIRefreshControl()
    var catalogList = [CatalogType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTableview()
        self.getCatalogList()
    }
    
    // MARK: - Service Request

    func getCatalogList() {
        if Reachability.isConnectedToInternet {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            RequestAdapter.shared.getCatalogList(controller: self, endPointUrl: catalogListURL) { (error, jsonResponse) -> (Void) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if let data = jsonResponse {
                    let catalogdata = Catalog.saveCatalog(jsonObject: data)
                    self.configureView(catalogdata[0])
                    self.listTableView.reloadData()
                }
            }
        } else {
            let networkAlert = UIAlertController(title: "AssignmentPOC", message: "Please check your internet connection and try again later ", preferredStyle: UIAlertController.Style.alert)
            networkAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(networkAlert, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Configure UIView

    func configureView(_ catalog: Catalog) {
        self.title = catalog.title
        self.catalogList = catalog.rows
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

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

