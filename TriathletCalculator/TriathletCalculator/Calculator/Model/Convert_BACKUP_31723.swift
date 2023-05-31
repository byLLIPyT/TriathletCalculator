//
//  Convert.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 12.07.2022.
//

import Foundation

protocol ConvertProtocol {
    func stringToInt(str: String) -> Int
    func stringToDouble(str: String) -> Double
    
}

struct Convert: ConvertProtocol {
    func stringToInt(str: String) -> Int {
        if let intValue = Int(str) {
            return intValue
        } else {
            return 0
        }
        
    }
    func stringToDouble(str: String) -> Double {
        if let intValue = Double(str) {
            return intValue
        } else {
            return 0.0
        }
    }
<<<<<<< HEAD
=======
    
    
>>>>>>> Develop
}
