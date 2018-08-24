//
//  RoofForm.swift
//  RoofingCalculatorSimple
//
//  Created by Arwa Ahmed on 8/14/18.
//  Copyright © 2018 Arwa Ahmed. All rights reserved.
//

import UIKit

class RoofForm: UITableViewController {
    
    
    @IBOutlet var tableV: UITableView!
    var house = House()
    
    // variables to hold all text fields & pickerview
    
    
    
    @IBOutlet weak var surfArea: UITextField!
    @IBOutlet weak var waste: UITextField!
    @IBOutlet weak var ridgeL: UITextField!
    @IBOutlet weak var hipL: UITextField!
    
    
    @IBOutlet weak var feltType: UITextField!
    @IBOutlet weak var overlapF: UITextField!
    
    var textFieldArr = [UITextField]()
    
    var selectedFelt: String!
    var feltOption = ["15", "30", "synthetic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(RoofForm.saveIntoHouse))
        
        tableV.backgroundView?.backgroundColor = UIColor.gray
        createTextArr()
        createFeltPicker()
        self.tableView.tableFooterView = UIView()
        addDoneButtonOnKeyboard()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    



    // set up the picker that lets user select felt type
    func createFeltPicker(){
        let feltTypePicker = UIPickerView()
        feltTypePicker.delegate = self
        feltType.inputView = feltTypePicker
        
        //default option is 15
        feltType.text = feltOption[0]
        selectedFelt = feltOption[0]
    }
    
    // hold all the text fields in an array
    func createTextArr(){
        
        textFieldArr.append(surfArea)
        textFieldArr.append(waste)
        textFieldArr.append(ridgeL)
        textFieldArr.append(hipL)
        textFieldArr.append(overlapF)
    }
    
    // add a done bar to the keyboards
    func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneClicked))
        
        toolbar.setItems([flexibleSpace, doneBtn], animated: false)
        
        for i in textFieldArr{
            i.inputAccessoryView = toolbar
        }
        
    }
    
    // when click done in keyboard, end editing
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    
    // Function that will save all the inputs into a House instance and move onto the report view
    @objc func saveIntoHouse(){
        guard let _ = surfArea.text, let sAD = Double(surfArea.text!) else{
            return
        }
        guard let _ = waste.text, let wFD = Double(waste.text!) else{
            return
        }
        guard let _ = ridgeL.text, let rLD = Double(ridgeL.text!)  else{
            return
        }
        guard let _ = hipL.text, let hLD = Double(hipL.text!) else{
            return
        }
        
        house.feltType = selectedFelt

        guard let _ = overlapF.text, let oFD = Double(overlapF.text!) else{
            return
        }
        house.surfArea = sAD
        
        house.wastageFactor = wFD
        house.ridgeLength = rLD
        house.hipLength = hLD
        house.overlapFac = oFD
        
        performSegue(withIdentifier: "segueToReport", sender: self)
    }
    
    // send the house object in this view controller to the report view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToReport"
        {
            if let vc = segue.destination as? Report{
                vc.house = house
                
            }
        }
    }

}



extension RoofForm: UITextFieldDelegate{
    

}

extension RoofForm: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return feltOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return feltOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFelt = feltOption[row]
        feltType.text = selectedFelt
    }
    
    
}
