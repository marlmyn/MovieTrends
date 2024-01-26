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
    
    //MARK: ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        print("Hi")
    }

    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemCyan
        
        setupTableView()
    }

}
