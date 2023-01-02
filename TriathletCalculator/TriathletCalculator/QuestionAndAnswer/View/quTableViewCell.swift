//
//  quTableViewCell.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 30.08.2022.
//

import UIKit

class quTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var verticalView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        let questionViewColor = UIColor(named: "questionView")
        let verticalViewColor = UIColor(named: "verticalViewColor")
        let questionTextColor = UIColor(named: "colorHeaderText")
        let answerTextColor = UIColor(named: "colorText")
        viewCell.backgroundColor = questionViewColor
        viewCell.layer.cornerRadius = 12
        verticalView.backgroundColor = verticalViewColor
        questionLabel.textColor = questionTextColor
        answerLabel.textColor = answerTextColor
    }
}
