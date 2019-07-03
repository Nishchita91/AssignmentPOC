//
//  CatalogListTableViewCell.swift
//  AssignmentPOC
//
//  Created by Nishchita on 02/07/19.
//  Copyright © 2019 Nishchita. All rights reserved.
//

import UIKit
import SDWebImage

class CatalogListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    
    private let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let imageview : UIImageView = {
        let imgView = UIImageView(image: UIImage())
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    var row : CatalogType? {
        didSet {
            nameLabel.text = row?.title
            descriptionLabel.text = row?.description
            imageview.sd_setImage(with: URL(string: row?.imageHref ?? ""), placeholderImage: UIImage(named: "default"))
        }
    }
    
    // MARK: - Configure the cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageview)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        
        imageview.anchorPoints(topMargin: topAnchor, leftMargin: leftAnchor, bottomMargin: nil, rightMargin: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 90, enableInsets: false)
        nameLabel.anchorPoints(topMargin: topAnchor, leftMargin: imageview.rightAnchor, bottomMargin: descriptionLabel.topAnchor, rightMargin: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width - 10, height: 0, enableInsets: false)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            descriptionLabel.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 2),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
