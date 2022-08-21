//
//  Sport.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 23.07.2022.
//

import Foundation

class Sport {
    var type: SportType
    var distance: Double
    
    var hourTime: Int?
    var minuteTime: Int?
    var secondTime: Int?
    
    var minutePace: Int?
    var secondPace: Int?
    
    var speed: Double?
    
        
    init (type: SportType, distance: Double) {
        self.type = type
        self.distance = distance
    }
    
    func calculateSpeed(hours: Int, minutes: Int, seconds: Int, pace: Double) -> Double {
        if pace == 0 {       
        let speed = distance / (Double(hours) + Double(minutes) / 60.0 + Double(seconds) / 3600.0)
        return round(speed * 100) / 100
        } else {
            if type == .swim {
                let speed = 60 / ((pace * 10) / 60)
                return round(speed * 100) / 100
            } else {
                let speed = 60 / ((pace) / 60)
                return round(speed * 100) / 100
            }            
        }        
    }
    
    func calculateTime(hours: Int, minutes: Int, seconds: Int, speed: Double) -> (Int, Int, Int) {
        let time = Int(distance / speed * 3600)
        var timeHour = 0
        let timeSec = time % 60
        var timeMin = (time - timeSec) / 60
        if timeMin - (timeMin % 60) > 0 {
            timeHour = (timeMin - (timeMin % 60)) / 60
            timeMin = timeMin - timeHour * 60
        }
        return (timeHour , timeMin, timeSec)
    }
    
    func calculatePace(hours: Int, minutes: Int, seconds: Int, speed: Double, sportType: SportType) -> (Int, Int) {
        if speed == 0 {
        let pace = (Double(hours) * 60 + Double(minutes) + Double(seconds) / 60) / (distance * 10)
        let paceMin = pace.rounded(.down)
        let paceSec = ((60 * ((pace - paceMin) * 100)) / 100).rounded(.down)
        return (Int(paceMin), Int(paceSec))
        } else {
            let pace = sportType == .swim ? 60 / speed / 10 : 60 / speed
            let paceMin = pace.rounded(.down)
            let paceSec = ((60 * ((pace - paceMin) * 100)) / 100).rounded(.down)
            return (Int(paceMin), Int(paceSec))
        }
    }
}
