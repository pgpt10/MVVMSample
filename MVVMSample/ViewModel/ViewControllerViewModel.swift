//
//  ViewControllerViewModel.swift
//  MVVMSample
//
//  Created by Payal Gupta on 17/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import Foundation

class ViewControllerViewModel
{
    //MARK: Private Properties
    private var cellModels = [Library](){
        didSet{
            
        }
    }
    private var isLoading = false{
        didSet{
            self.updateLoadingStatus?()
        }
    }
    
    //MARK: Internal Properties
    var reloadTableViewClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    var numberOfCells: Int{
        return self.cellModels.count
    }
    
    //MARK: Initializer
    init()
    {
        self.fetchLibraryList()
    }
    
    //MARK: Internal Methods
    func getModel(at indexPath: IndexPath) -> Library
    {
        return self.cellModels[indexPath.row]
    }
    
    //MARK: Private Methods
    func fetchLibraryList()
    {
        self.isLoading = true
        if let path = Bundle.main.path(forResource: "LibraryList", ofType: "json")
        {
            if let libraryList = try? JSONDecoder().decode([Library].self, from: Data.init(contentsOf: URL(fileURLWithPath: path)))
            {
                self.isLoading = false
                self.cellModels = libraryList
            }
        }
    }
}
