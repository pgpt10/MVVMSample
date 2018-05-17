//
//  LibraryTableViewCell.swift
//  MVVMSample
//
//  Created by Payal Gupta on 16/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class LibraryTableViewCell: UITableViewCell
{
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: Lifecycle Methods
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    //MARK: Internal Methods
    func configure(with library: Library)
    {
        self.titleLabel.text = library.title
        self.descriptionLabel.text = library.description
    }
}
