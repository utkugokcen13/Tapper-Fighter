//
//  ScoreCell.swift
//  TapperFighter
//
//  Created by Utku Gökçen on 13.11.2022.
//

import UIKit

class ScoreCell: UITableViewCell {

    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func config(user: User){
        scoreLabel.text = String(user.score)
        usernameLabel.text = user.name
    }
    
}
