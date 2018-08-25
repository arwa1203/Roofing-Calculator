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
        addNavigation()
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
    
    func addNavigation(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save Report", style: .done, target: self, action: #selector(Report.saveHouseReport))
    }
    
    
    @objc func saveHouseReport(){
        
        var nameTxt = UITextField()
        var addressTxt = UITextField()
        
        
        // allow user to type the name they want to save this report as
        let alert = UIAlertController(title: "Save Roof", message: "Enter name of roof and address", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            // save the information they typed into and the house item info into core data
            
        }
        alert.addTextField(configurationHandler: { (alertNameTextField) in
            alertNameTextField.placeholder = "Name (required)"
            
            alertNameTextField.addTarget(self, action: #selector(self.textFieldTextDidChange(_:)), for: .editingChanged)
            nameTxt = alertNameTextField
        })
        
        alert.addTextField { (alertAddTextField) in
            alertAddTextField.placeholder = "Address"
            addressTxt = alertAddTextField
        }
        
        action.isEnabled = false
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
        
    }
 
    /* checks if name field is empty */
    @objc func textFieldTextDidChange(_ sender: Any) {
        let tf = sender as! UITextField
        var resp : UIResponder! = tf
        while !(resp is UIAlertController) { resp = resp.next }
        let alert = resp as! UIAlertController
        alert.actions[0].isEnabled = (tf.text != "")
    }

}
