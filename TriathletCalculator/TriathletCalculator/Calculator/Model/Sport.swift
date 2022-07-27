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
    
    func calculateSpeed(hours: Int, minutes: Int, seconds: Int) -> Double {
        return 0.0
    }
    
    func calculateTime(hours: Int, minutes: Int, seconds: Int) -> (Int, Int, Int) {
        return (5 , 10, 4)
    }
    
    func calculatePace(hours: Int, minutes: Int, seconds: Int) -> (Int, Int) {
        return (5 , 10)
    }
}
