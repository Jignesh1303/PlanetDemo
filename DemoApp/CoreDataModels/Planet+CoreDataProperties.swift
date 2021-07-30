//
//  Planet+CoreDataProperties.swift
//  DemoApp
//
//  Created by Jignesh Patel on 28/07/21.
//
//

import Foundation
import CoreData


extension Planet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planet> {
        return NSFetchRequest<Planet>(entityName: "Planet")
    }

    @NSManaged public var climate: String?
    @NSManaged public var createdDate: String?
    @NSManaged public var diameter: String?
    @NSManaged public var editedDate: String?
    @NSManaged public var gravity: String?
    @NSManaged public var name: String?
    @NSManaged public var orbitalPeriod: String?
    @NSManaged public var population: String?
    @NSManaged public var rotationPeriod: String?
    @NSManaged public var surfaceWater: String?
    @NSManaged public var terrain: String?

}

extension Planet : Identifiable {

}
