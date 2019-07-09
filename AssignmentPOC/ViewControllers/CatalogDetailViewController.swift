//
//  CatalogDetailViewController.swift
//  AssignmentPOC
//
//  Created by Nishchita on 03/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import UIKit

class CatalogDetailViewController: UIViewController {
    
    var details : Row?
    
    lazy var imageview: UIImageView = {
        let image = UIImageView()
        image.sd_setImage(with: URL(string: details?.imageHref ?? ""), placeholderImage: UIImage(named: "default"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descLabel = UILabel()
        if details?.rowDescription == "" || details?.rowDescription == nil {
            descLabel.text = "Data does not exist"
        } else {
            descLabel.text = details?.rowDescription
        }
        descLabel.numberOfLines = 0
        return descLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = details?.title
        self.setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup the view by setting constraints
    
    func setUpView() {
        self.view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            imageview.widthAnchor.constraint(equalToConstant: 150),
            imageview.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        self.view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
            ])
    }
}
