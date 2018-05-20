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
    private let viewModel = ViewModel()
    private lazy var headerView: UIView? = {[weak self] in
        let header = Bundle.main.loadNibNamed("TableHeaderView", owner: self, options: nil)?.first as? TableHeaderView
        header?.headerLabel.text = self?.viewModel.tableHeader
        return header
    }()
    
    //MARK: Lifecycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.tableHeaderView = self.headerView
        self.tableView.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTableViewCell")
        self.viewModel.reloadTableViewClosure = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        self.viewModel.updateLoadingStatus = {[weak self](isLoading) in
            DispatchQueue.main.async {
                if isLoading
                {
                    self?.activityIndicator.startAnimating()
                }
                else
                {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.numberOfLibraries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath) as! LibraryTableViewCell
        let cellModel = self.viewModel.getLibrary(at: indexPath)
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension //TODO: where to write this?
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0 //TODO: where to write this?
    }
}

