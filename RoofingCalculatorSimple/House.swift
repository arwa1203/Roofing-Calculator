//
//  House.swift
//  RoofingCalculatorSimple
//
//  Created by Arwa Ahmed on 8/15/18.
//  Copyright © 2018 Arwa Ahmed. All rights reserved.
//

import Foundation

class House{
    var surfArea: Double = 0
    var wastageFactor = 0.10
    var ridgeLength: Double = 0
    var hipLength: Double = 0
    var feltType: String = ""
    var overlapFac: Double = 0
    
    // Must calculate before retrieving amount, Int because people by things in whole not parts
    private var sSquare: Int = 0
    private var rHBundle: Int = 0
    private var rollsOfFelt: Int = 0
    
    /* getShinglesBundles returns amount of bundles which is number of squares times 3 (Int) */
    func getShingleBundles()->Int{
        return sSquare*3
    }
    /* getSquares() returns number of squares needed based on surface area and wastage factor */
    func getSquares()->Int{
        
        sSquare = Int((((surfArea)/100 * (1 + (wastageFactor/100))).rounded(.up)))
        return sSquare
    }
    
    /* getRHBundles returns number of bundles needed for ridges and hips*/
    func getRHBundle()->Int{
        rHBundle = Int(((ridgeLength + hipLength)/32).rounded(.up))
        return rHBundle
    }
    
    /* getRolls returns number of rolls needed depending on the type of roll */
    func getRolls()->Int{
        switch feltType {
        case "15":
            rollsOfFelt = Int((surfArea/400).rounded(.up))
            break
        case "30":
            rollsOfFelt = Int((surfArea/200).rounded(.up))
            break
        case "synthetic":
            rollsOfFelt = Int((surfArea/1000).rounded(.up))
            break
        default:
            break
        }
        return rollsOfFelt
    }
    
    /* getRollsWithOverlap returns number of rolls needed with overlapping considered */
    func getRollsWithOverlap()->Int{
        let overlapDec = overlapFac/100
        return Int(Double(rollsOfFelt) * (1 + overlapDec))
        
    }
    
    
    
    
}
