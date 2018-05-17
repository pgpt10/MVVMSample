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
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Private Properties
    let viewModel = ViewControllerViewModel()
    
    //MARK: Lifecycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTableViewCell")
        self.viewModel.reloadTableViewClosure = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        self.viewModel.fetchLibraryList()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath) as! LibraryTableViewCell
        let cellModel = self.viewModel.getModel(at: indexPath)
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0
    }
}

