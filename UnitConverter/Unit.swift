//
//  Unit.swift
//  UnitConverter
//
//  Created by Radu Petrisel on 06.07.2023.
//

import Foundation

enum Unit: String, CaseIterable {
    case meters = "meters"
    case kilometers = "kilometers"
    case miles = "miles"
    case feet = "feet"
    
    var ratioToMeters: Double {
        switch self {
        case .meters:
            return 1
        case .kilometers:
            return 1000
        case .miles:
            return 1600
        case .feet:
            return 0.3
        }
    }
}
