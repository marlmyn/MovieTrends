//
//  DetailsMovieViewController.swift
//  MovieTrends
//
//  Created by Akmaral Ergesh on 11.02.2024.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var desciptionLabel: UILabel!
    
    //MARK: ViewModel
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        desciptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }

}
