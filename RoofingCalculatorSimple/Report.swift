//
//  Report.swift
//  RoofingCalculatorSimple
//
//  Created by Arwa Ahmed on 8/20/18.
//  Copyright © 2018 Arwa Ahmed. All rights reserved.
//

import UIKit

class Report: UIViewController {
    var house: House!

    // Variables from storyboard
    @IBOutlet weak var numOfSq: UILabel!
    @IBOutlet weak var numOfBundles: UILabel!
    @IBOutlet weak var numOfHRB: UILabel!
    @IBOutlet weak var numOfRolls: UILabel!
    @IBOutlet weak var numOfRollsOverlap: UILabel!
    @IBOutlet weak var rollsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillInReport()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* fillInReport fills calculation results needed for the report*/
    func fillInReport(){
        numOfSq.text = String(house.getSquares())
        numOfBundles.text = String(house.getShingleBundles())
        numOfHRB.text = String(house.getRHBundle())
        
        rollsLabel.text = (rollsLabel.text ?? "") + " ( \(house.feltType) )"
        numOfRolls.text = String(house.getRolls())
        numOfRollsOverlap.text = String(house.getRollsWithOverlap())
        
        
    }
    

 

}
