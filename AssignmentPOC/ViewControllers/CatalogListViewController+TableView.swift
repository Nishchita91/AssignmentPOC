//
//  CatalogListViewController+TableView.swift
//  AssignmentPOC
//
//  Created by Nishchita on 03/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import UIKit

extension CatalogListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatalogListTableViewCell
        let rowData = catalogList[indexPath.row]
        cell.row = rowData
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CatalogDetailViewController()
        vc.details = catalogList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
