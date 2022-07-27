//
//  CalculatorViewController.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 29.04.2022.
//

import UIKit

class CalculatorViewController: UIViewController,UITextFieldDelegate {

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
    
    var swimModel = Swim()
    let convert = Convert()
    let storageService = StorageService()
    
    var swimSport: Sport?
    var bikeSport: Sport?
    var runSport: Sport?
    var firstTransitZone: TransitZone?
    var secondTransitZone: TransitZone?
    var swimDistance: Double = 0.0
    var bikeDistance: Double = 0.0
    var runDistance: Double = 0.0
    
    //MARK: - override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if storageService.getSwimDistance() == 0.0
            || storageService.getBikeDistance() == 0.0
            || storageService.getRunDistance() == 0.0 {
            storageService.setSwimDistance(distance: 1.9)
            storageService.setBikeDistance(distance: 90.0)
            storageService.setRunDistance(distance: 21.0)
        }
        swimDistance = storageService.getSwimDistance()
        bikeDistance = storageService.getBikeDistance()
        runDistance = storageService.getRunDistance()
        
        
        swimSport = Sport(type: .swim, distance: swimDistance)
        bikeSport = Sport(type: .bike, distance: bikeDistance)
        runSport  = Sport(type: .run, distance: runDistance)
        
        firstTransitZone = TransitZone(zoneNumber: .first)
        secondTransitZone = TransitZone(zoneNumber: .second)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    
    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    @IBAction func changeTypeRace(_ sender: Any) {
        
    }
    
    @IBAction func changeTypeMeasures(_ sender: Any) {
        
    }
    
    @IBAction func swimHourTextChange(_ sender: Any) {
        calculateWhenTimeChanged()
    }
    
    @IBAction func swimMinutesTextChange(_ sender: Any) {
        calculateWhenTimeChanged()
    }
    
    @IBAction func swimSecondsTextChange(_ sender: Any) {
        calculateWhenTimeChanged()
    }
    
    @IBAction func swimMinutesPaceTextChange(_ sender: Any) {
        calculateWhenPaceChanged()
    }
    
    @IBAction func swimSecondsPaceTextChange(_ sender: Any) {
        calculateWhenPaceChanged()
    }
    
    @IBAction func swimSpeedTextChange(_ sender: Any) {
        calculateWhenSpeedChanged()
    }
    
    private func calculateWhenTimeChanged() {
        let hourInt = convert.stringToInt(str: swimHoursTime.text!)
        let minInt = convert.stringToInt(str: swimMinutesTime.text!)
        let secInt = convert.stringToInt(str: swimSecondsTime.text!)
        let speed = swimSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt)
        let pace = swimSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt)
        if let speed = speed, let pace = pace {
            swimSpeed.text = String(speed)
            swimMinutesPace.text = String(pace.0)
            swimSecondsPace.text = String(pace.1)
        }
    }
    
    private func calculateWhenPaceChanged() {
        let hourInt = convert.stringToInt(str: swimHoursTime.text!)
        let minInt = convert.stringToInt(str: swimMinutesTime.text!)
        let secInt = convert.stringToInt(str: swimSecondsTime.text!)
        let speed = swimSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt)
        let time = swimSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt)
        if let speed = speed, let time = time {
            swimSpeed.text = String(speed)
            swimHoursTime.text = String(time.0)
            swimSecondsPace.text = String(time.1)
            swimSecondsTime.text = String(time.2)
        }
    }
    
    private func calculateWhenSpeedChanged() {
        let hourInt = convert.stringToInt(str: swimHoursTime.text!)
        let minInt = convert.stringToInt(str: swimMinutesTime.text!)
        let secInt = convert.stringToInt(str: swimSecondsTime.text!)
        let speed = swimSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt)
        let time = swimSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt)
        if let speed = speed, let time = time {
            swimSpeed.text = String(speed)
            swimHoursTime.text = String(time.0)
            swimSecondsPace.text = String(time.1)
            swimSecondsTime.text = String(time.2)
        }
    }
}
