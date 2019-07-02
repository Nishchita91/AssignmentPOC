//
//  CatalogListViewController.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import UIKit

class CatalogListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getCatalogList()
    }
    
    // MARK: - Service Request

    func getCatalogList() {
        RequestAdapter.shared.getCatalogList(controller: self, endPointUrl: catalogListURL) { (error, jsonResponse) -> (Void) in
            if let object = jsonResponse as? [String: AnyObject] {
                self.configureView(object)
            }
        }
    }
    
    // MARK: - Configure UIView

    func configureView(_ data: [String: AnyObject]) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
