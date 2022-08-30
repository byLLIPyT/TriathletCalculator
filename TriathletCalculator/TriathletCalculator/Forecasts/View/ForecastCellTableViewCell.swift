//
//  ForecastCellTableViewCell.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 29.08.2022.
//

import UIKit

class ForecastCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var swimView: UIView!
    @IBOutlet weak var bikeView: UIView!
    @IBOutlet weak var runView: UIView!
    @IBOutlet weak var t1View: UIView!
    @IBOutlet weak var t2View: UIView!
            
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupUI() {
        
        let backgroundColor = UIColor(named: "backgroundcolor")
        let swimViewColor = UIColor(named: "swimView")
        let bikeViewColor = UIColor(named: "bikeView")
        let runViewColor = UIColor(named: "runView")
        let transitViewColor = UIColor(named: "transitView")
        let textColor = UIColor(named: "timeTextColor")
                       
        self.backgroundColor = backgroundColor
        swimView.backgroundColor = swimViewColor
        bikeView.backgroundColor = bikeViewColor
        runView.backgroundColor = runViewColor
        forecastLabel.textColor = textColor
        totalTimeLabel.textColor = textColor
        t1View.backgroundColor = transitViewColor
        t2View.backgroundColor = transitViewColor
    }

}
