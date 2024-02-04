//
//  MainViewController.swift
//  MovieTrends
//
//  Created by Akmaral Ergesh on 26.01.2024.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: IBOutlets:
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //MARK: Variables
    var cellDataSource: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }

    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemCyan
        
        setupTableView()
    }

    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}
