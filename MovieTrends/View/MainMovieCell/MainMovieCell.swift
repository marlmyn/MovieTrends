//
//  MainMovieCell.swift
//  MovieTrends
//
//  Created by Akmaral Ergesh on 10.02.2024.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    //MARK: IBOutlets
    @IBOutlet var backView: UIView!
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = UIColor.lightGray
        movieImageView.round(5)
    }

    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
