//
//  DBHelper.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBHelper{
    
    static let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    static let PLANET_TABLE = "Planet"
    //MARK:- Category
    static func addPlanet(planet : PlanetModel){

        let entity = NSEntityDescription.entity(forEntityName: PLANET_TABLE, in: managedContext)!
        let planetDB = NSManagedObject(entity: entity, insertInto: managedContext) as! Planet
        planetDB.name = planet.name
        planetDB.rotationPeriod = planet.rotation_period
        planetDB.orbitalPeriod = planet.orbital_period
        planetDB.diameter = planet.diameter
        planetDB.climate = planet.climate
        planetDB.gravity = planet.gravity
        planetDB.terrain = planet.terrain
        planetDB.surfaceWater = planet.surface_water
        planetDB.population = planet.population
        planetDB.createdDate = planet.created
        planetDB.editedDate = planet.edited
        do {
            try managedContext.save()
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    static func getAllPlanets() -> [Planet]?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PLANET_TABLE)
        do {
            let results = try managedContext.fetch(fetchRequest);
            return results as? [Planet]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
}
