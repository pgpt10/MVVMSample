//
//  TableHeaderView.swift
//  MVVMSample
//
//  Created by Payal Gupta on 20/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class TableHeaderView: UIView
{
    //MARK: Outlets
    @IBOutlet weak var headerLabel: UILabel!
    
    //MARK: Lifecycle Methods
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.headerLabel.text = nil
    }
}
