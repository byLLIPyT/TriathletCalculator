//
//  CalculatorViewController.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 29.04.2022.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var totalTimeLabel: UILabel!
    
    //MARK: - Swim
    
    @IBOutlet weak var swimHoursTime: UITextField!
    @IBOutlet weak var swimMinutesTime: UITextField!
    @IBOutlet weak var swimSecondsTime: UITextField!
    @IBOutlet weak var swimMinutesPace: UITextField!
    @IBOutlet weak var swimSecondsPace: UITextField!
    @IBOutlet weak var swimSpeed: UITextField!
    
    //MARK: - Bike
    
    @IBOutlet weak var bikeHoursTime: UITextField!
    @IBOutlet weak var bikeMinutesTime: UITextField!
    @IBOutlet weak var bikeSecondsTime: UITextField!
    @IBOutlet weak var bikeMinutesPace: UITextField!
    @IBOutlet weak var bikeSecondsPace: UITextField!
    @IBOutlet weak var bikeSpeed: UITextField!
    
    //MARK: - Run
    
    @IBOutlet weak var runHoursTime: UITextField!
    @IBOutlet weak var runMinutesTime: UITextField!
    @IBOutlet weak var runSecondsTime: UITextField!
    @IBOutlet weak var runMinutesPace: UITextField!
    @IBOutlet weak var runSecondsPace: UITextField!
    @IBOutlet weak var runSpeed: UITextField!
    
    //MARK: - Transit zones
    
    @IBOutlet weak var firstTransitMinutes: UITextField!
    @IBOutlet weak var firstTransitSeconds: UITextField!
    @IBOutlet weak var secondTransitMinutes: UITextField!
    @IBOutlet weak var secondTransitSeconds: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    @IBAction func changeTypeRace(_ sender: Any) {
        
    }
    
    @IBAction func changeTypeMeasures(_ sender: Any) {
        
    }
    
}
