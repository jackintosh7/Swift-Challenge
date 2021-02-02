//
//  MovieTableViewCell.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/28/21.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var year: UILabel!
    
    func setMovie(movie: MovieModel) {
        self.title.text = movie.title
        self.year.text = movie.year
        
        if let posterStr = movie.poster {
            let url = URL(string: posterStr)
            self.poster.kf.setImage(with: url)
        } else {
            //TODO: PLACEHOLDER IMAGE
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
