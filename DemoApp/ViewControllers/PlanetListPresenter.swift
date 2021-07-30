//
//  PlanetListPresenter.swift
//  DemoApp
//
//  Created by Jignesh Patel on 28/07/21.
//

import UIKit

protocol PlanetListPresentation {
    func displayPlanets(planets: [Planet]?)
}

class PlanetListPresenter: PlanetListPresentation {
    weak var planetListVC : PlanetListVC?
    
    func displayPlanets(planets: [Planet]?) {
        planetListVC?.displayPlanets(planets: planets)
    }
    
}
