//
//  StorageService.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 12.07.2022.
//

import Foundation

protocol StorageServiceProtocol {
    func setSwimDistance(distance: Double)
    func setBikeDistance(distance: Double)
    func setRunDistance(distance: Double)
    func getSwimDistance() -> Double
    func getBikeDistance() -> Double
    func getRunDistance() -> Double
}

struct StorageService: StorageServiceProtocol {
    let defaults = UserDefaults.standard
    
    func setSwimDistance(distance: Double) {
        defaults.set(distance, forKey: "swimDistance")
    }
    
    func setBikeDistance(distance: Double) {
        defaults.set(distance, forKey: "bikeDistance")
    }
    
    func setRunDistance(distance: Double) {
        defaults.set(distance, forKey: "runDistance")
    }
    
    func getSwimDistance() -> Double {
        if let distance = defaults.value(forKey: "swimDistance") as? Double {
            return distance
        } else {
            return 0.0
        }
    }
    
    func getBikeDistance() -> Double {
        if let distance = defaults.value(forKey: "bikeDistance") as? Double {
            return distance
        } else {
            return 0.0
        }
    }
    
    func getRunDistance() -> Double {
        if let distance = defaults.value(forKey: "runDistance") as? Double {
            return distance
        } else {
            return 0.0
        }
    }
}
