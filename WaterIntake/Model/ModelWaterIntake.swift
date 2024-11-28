//
//  ModelWaterIntake.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 28/11/24.
//

import Foundation

enum WaterIntakeType: String{
    case Glass
    case Bottle
}

struct ModelWaterIntake: Identifiable {
    
    let id = UUID().uuidString
    let img, quantity, time, unit: String
    let type: WaterIntakeType
    
    
}
