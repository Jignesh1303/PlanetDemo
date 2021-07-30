//
//  PlanetListInteractor.swift
//  DemoApp
//
//  Created by Jignesh Patel on 28/07/21.
//

import UIKit

class PlanetListInteractor: NSObject {

    var planetListPresenter : PlanetListPresenter? = nil
    
    func displayPlanets(){
        //get planets to display
        let planets = DBHelper.getAllPlanets()
        planetListPresenter?.displayPlanets(planets: planets)
    }
    
    func getPlanets(){
        
        guard let planets = DBHelper.getAllPlanets(), !planets.isEmpty else {
            fetchPlanets()
            return
        }
        planetListPresenter?.displayPlanets(planets: planets)
    }
    
    func fetchPlanets(){
        //fetch planets from API
        NetworkManager.get { [weak self] (response) in
            if !response.results.isEmpty{
                self?.insertPlanets(planets: response.results)
            }
            self?.displayPlanets()
        } failure: { [weak self] (error) in
            print(error)
            self?.displayPlanets()
        }
    }
    
    func insertPlanets(planets: [PlanetModel]){
        //Insert new planets to local database
        for planet in planets{
            DBHelper.addPlanet(planet: planet)
        }
    }
}
