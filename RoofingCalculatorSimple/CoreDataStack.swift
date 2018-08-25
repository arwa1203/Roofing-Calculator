////
////  CoreDataStack.swift
////  RoofingCalculatorSimple
////
////  Created by Arwa Ahmed on 8/24/18.
////  Copyright © 2018 Arwa Ahmed. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//class CoreDataStack{
//    
//    
//    lazy var managedObjectContext: NSManagedObjectContext = {
//        let container = self.persistentContainer
//        return container.viewContext
//    }()
//    
//    private lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "RoofingCalc")
//        container.loadPersistentStores() { storeDescription, error in
//            if let error = error as NSError? {
//                fatalError("Unresolved error + \(error), \(error.userInfo)")
//            }
//        }
//        
//        return container
//    }()
//}
