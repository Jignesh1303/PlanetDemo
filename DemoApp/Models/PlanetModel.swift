//
//  PlanetModel.swift
//  Created by Jignesh Patel on 28/07/21.
//
import Foundation

class PlanetResponse: Codable{
    
    var results: [PlanetModel]
    var count: Int
    
    static func model(_ data: Data) -> PlanetResponse? {
        //decode json
        return try? JSONDecoder().decode(PlanetResponse.self, from: data)
    }
}

class PlanetModel: Codable{
    //Planet details
    var name: String
    var rotation_period: String
    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surface_water: String
    var population: String
    var created: String
    var edited: String
}
