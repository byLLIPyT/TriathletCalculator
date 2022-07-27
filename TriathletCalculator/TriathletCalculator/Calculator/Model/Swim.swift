//
//  Swim.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 07.05.2022.
//

import Foundation

struct Swim {
    let hours: Int = 0
    let minutes: Int = 0
    let seconds: Int = 0
    let paceMin: Int = 0
    let paceSec: Int = 0
    let speed: Double = 0
    
    func calculateSpeed(hours: Int, minutes: Int, seconds: Int, minPace: Int, secPace: Int) -> Double {
        return 0.0
    }
    
    func calculateTime(hours: Int, minutes: Int, seconds: Int) -> Double {
        return 50.0
    }
    
    func calculatePace(hours: Int, minutes: Int, seconds: Int) -> Double {
        return 66.6
    }
}
