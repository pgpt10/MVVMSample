//
//  ViewController.swift
//  MVVMSample
//
//  Created by Payal Gupta on 16/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}

