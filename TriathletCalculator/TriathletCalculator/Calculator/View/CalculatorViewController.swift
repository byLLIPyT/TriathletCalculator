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
    
    //MARK: - Swim actions
    
    @IBAction func swimHourTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .swim)
    }
        
    @IBAction func swimMinutesTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .swim)
    }
       
    @IBAction func swimSecondsTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .swim)
    }
    
    @IBAction func swimMinutesPaceTextChanged(_ sender: Any) {
        calculateWhenPaceChanged(sportType: .swim)
    }
    
    @IBAction func swimSecondsPaceTextChanged(_ sender: Any) {
        calculateWhenPaceChanged(sportType: .swim)
    }
    
    @IBAction func swimSpeedTextChanged(_ sender: Any) {
        calculateWhenSpeedChanged(sportType: .swim)
    }
    
    //MARK: - Bike actions
    
    @IBAction func bikeHourTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .bike)
    }
    
    @IBAction func bikeMinutesTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .bike)
    }
    
    @IBAction func bikeSecondsTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .bike)
    }
    
    @IBAction func bikeMinutesPaceTextChanged(_ sender: Any) {
        calculateWhenPaceChanged(sportType: .bike)
    }
    
    @IBAction func bikeSecondsPaceTextChanged(_ sender: Any) {
        calculateWhenPaceChanged(sportType: .bike)
    }
    
    @IBAction func bikeSpeedTextChanged(_ sender: Any) {
        calculateWhenSpeedChanged(sportType: .bike)
    }
    
    //MARK: - Run actions
    
    @IBAction func runHourTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .run)
    }
    
    @IBAction func runMinutesTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .run)
    }
    
    @IBAction func runSecondsTextChanged(_ sender: Any) {
        calculateWhenTimeChanged(sportType: .run)
    }
    
    @IBAction func runMinutesPaceTextChanged(_ sender: Any) {
        calculateWhenPaceChanged(sportType: .run)
    }
    
    @IBAction func runSecondsPaceTextChanged(_ sender: Any) {
        calculateWhenPaceChanged(sportType: .run)
    }
    
    @IBAction func runSpeedTextChanged(_ sender: Any) {
        calculateWhenSpeedChanged(sportType: .run)
    }
    
    //MARK: - Private functions
    
    private func calculateWhenTimeChanged(sportType: SportType) {
        switch sportType {
        case .swim:
            let hourInt = convert.stringToInt(str: swimHoursTime.text!)
            let minInt = convert.stringToInt(str: swimMinutesTime.text!)
            let secInt = convert.stringToInt(str: swimSecondsTime.text!)
            let speed = swimSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt, pace: 0.0)
            if let speed = speed {
                let pace = swimSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed, sportType: sportType)
                if let pace = pace {
                    swimSpeed.text = String(speed)
                    swimMinutesPace.text = String(pace.0)
                    swimSecondsPace.text = String(pace.1)
                }
            }
        case .bike:
            let hourInt = convert.stringToInt(str: bikeHoursTime.text!)
            let minInt = convert.stringToInt(str: bikeMinutesTime.text!)
            let secInt = convert.stringToInt(str: bikeSecondsTime.text!)
            let speed = bikeSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt, pace: 0.0)
            if let speed = speed {
                let pace = bikeSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed, sportType: sportType)
                if let pace = pace {
                    bikeSpeed.text = String(speed)
                    bikeMinutesPace.text = String(pace.0)
                    bikeSecondsPace.text = String(pace.1)
                }
            }
        case .run:
            let hourInt = convert.stringToInt(str: runHoursTime.text!)
            let minInt = convert.stringToInt(str: runMinutesTime.text!)
            let secInt = convert.stringToInt(str: runSecondsTime.text!)
            let speed = runSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt, pace: 0.0)
            if let speed = speed {
                let pace = runSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed, sportType: sportType)
                if let pace = pace {
                    runSpeed.text = String(speed)
                    runMinutesPace.text = String(pace.0)
                    runSecondsPace.text = String(pace.1)
                }
            }
        }
    }
    
    private func calculateWhenPaceChanged(sportType: SportType) {
        switch sportType {
        case .swim:
            let hourInt = convert.stringToInt(str: swimHoursTime.text!)
            let minInt = convert.stringToInt(str: swimMinutesTime.text!)
            let secInt = convert.stringToInt(str: swimSecondsTime.text!)
            let paceMin = convert.stringToDouble(str: swimMinutesPace.text!)
            let paceSec = convert.stringToDouble(str: swimSecondsPace.text!)
            let speed = swimSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt, pace: paceMin * 60 + paceSec)
            if let speed = speed {
                let time = swimSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed)
                if let time = time {
                    swimSpeed.text = String(speed)
                    swimHoursTime.text = String(time.0)
                    swimMinutesTime.text = String(time.1)
                    swimSecondsTime.text = String(time.2)
                }
            }
        case .bike:
            let hourInt = convert.stringToInt(str: bikeHoursTime.text!)
            let minInt = convert.stringToInt(str: bikeMinutesTime.text!)
            let secInt = convert.stringToInt(str: bikeSecondsTime.text!)
            let paceMin = convert.stringToDouble(str: bikeMinutesPace.text!)
            let paceSec = convert.stringToDouble(str: bikeSecondsPace.text!)
            let speed = bikeSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt, pace: paceMin * 60 + paceSec)
            if let speed = speed {
                let time = bikeSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed)
                if let time = time {
                    bikeSpeed.text = String(speed)
                    bikeHoursTime.text = String(time.0)
                    bikeMinutesTime.text = String(time.1)
                    bikeSecondsTime.text = String(time.2)
                }
            }
        case .run:
            let hourInt = convert.stringToInt(str: runHoursTime.text!)
            let minInt = convert.stringToInt(str: runMinutesTime.text!)
            let secInt = convert.stringToInt(str: runSecondsTime.text!)
            let paceMin = convert.stringToDouble(str: runMinutesPace.text!)
            let paceSec = convert.stringToDouble(str: runSecondsPace.text!)
            let speed = runSport?.calculateSpeed(hours: hourInt, minutes: minInt, seconds: secInt, pace: paceMin * 60 + paceSec)
            if let speed = speed {
                let time = runSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed)
                if let time = time {
                    runSpeed.text = String(speed)
                    runHoursTime.text = String(time.0)
                    runMinutesTime.text = String(time.1)
                    runSecondsTime.text = String(time.2)
                }
            }
        }
    }
    
    //TODO: - исправить расчет по темпу в беге и велосипеде - счиается из расчета на 100 метров, переделать на километры
    
    private func calculateWhenSpeedChanged(sportType: SportType) {
        switch sportType {
        case .swim:
            let hourInt = convert.stringToInt(str: swimHoursTime.text!)
            let minInt = convert.stringToInt(str: swimMinutesTime.text!)
            let secInt = convert.stringToInt(str: swimSecondsTime.text!)
            let speed = convert.stringToDouble(str: swimSpeed.text!)
            let pace = swimSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed, sportType: sportType)
            let time = swimSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed)
            if let time = time, let pace = pace {
                swimMinutesPace.text = String(pace.0)
                swimSecondsPace.text = String(pace.1)
                swimHoursTime.text = String(time.0)
                swimMinutesTime.text = String(time.1)
                swimSecondsTime.text = String(time.2)
            }
        case .bike:
            let hourInt = convert.stringToInt(str: bikeHoursTime.text!)
            let minInt = convert.stringToInt(str: bikeMinutesTime.text!)
            let secInt = convert.stringToInt(str: bikeSecondsTime.text!)
            let speed = convert.stringToDouble(str: bikeSpeed.text!)
            let pace = bikeSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed, sportType: sportType)
            let time = bikeSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed)
            if let time = time, let pace = pace {
                bikeMinutesPace.text = String(pace.0)
                bikeSecondsPace.text = String(pace.1)
                bikeHoursTime.text = String(time.0)
                bikeMinutesTime.text = String(time.1)
                bikeSecondsTime.text = String(time.2)
            }
        case .run:
            let hourInt = convert.stringToInt(str: runHoursTime.text!)
            let minInt = convert.stringToInt(str: runMinutesTime.text!)
            let secInt = convert.stringToInt(str: runSecondsTime.text!)
            let speed = convert.stringToDouble(str: runSpeed.text!)
            let pace = runSport?.calculatePace(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed, sportType: sportType)
            let time = runSport?.calculateTime(hours: hourInt, minutes: minInt, seconds: secInt, speed: speed)
            if let time = time, let pace = pace {
                runMinutesPace.text = String(pace.0)
                runSecondsPace.text = String(pace.1)
                runHoursTime.text = String(time.0)
                runMinutesTime.text = String(time.1)
                runSecondsTime.text = String(time.2)
            }
        }
    }
}
