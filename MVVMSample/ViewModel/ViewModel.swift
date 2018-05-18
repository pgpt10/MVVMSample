//
//  ViewModel.swift
//  MVVMSample
//
//  Created by Payal Gupta on 17/05/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import Foundation

class ViewModel
{
    //MARK: Private Properties
    private var libraries = [Library](){
        didSet{
            self.reloadTableViewClosure?()
        }
    }
    private var isLoading = false{
        didSet{
            self.updateLoadingStatus?(self.isLoading)
        }
    }
    
    //MARK: Internal Properties
    var reloadTableViewClosure: (()->())?
    var updateLoadingStatus: ((Bool)->())?
    
    //MARK: Initializer
    init()
    {
        self.fetchLibraryList()
    }
    
    //MARK: Private Methods
    private func fetchLibraryList()
    {
        self.isLoading = true
        if let path = Bundle.main.path(forResource: "LibraryList", ofType: "json")
        {
            if let libraryList = try? JSONDecoder().decode([Library].self, from: Data(contentsOf: URL(fileURLWithPath: path)))
            {
                self.libraries = libraryList
                self.isLoading = false
            }
        }
    }
}

//MARK: - Helper Properties and Methods
extension ViewModel
{
    var numberOfLibraries: Int{
        return self.libraries.count
    }

    func getLibrary(at indexPath: IndexPath) -> Library
    {
        return self.libraries[indexPath.row]
    }
}
