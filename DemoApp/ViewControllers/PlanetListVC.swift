//
//  PlanetListVC.swift
//  DemoApp
//
//  Created by Jignesh Patel on 28/07/21.
//

import UIKit

class PlanetListVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tblPlanets: UITableView!
    
    //MARK:- Variables
    var planetInteractor : PlanetListInteractor? = nil
    var allPlanets : [Planet]? {
        didSet{
            //It will update tableview when allPlanets changes
            tblPlanets.reloadData()
        }
    }
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupUI()
        getPlanets()
    }

    func setup(){
        //VIP architecture set up
        planetInteractor = PlanetListInteractor()
        let planetPresentor = PlanetListPresenter()
        self.planetInteractor?.planetListPresenter = planetPresentor
        planetPresentor.planetListVC = self
    }
    
    func setupUI(){
        //Table Automatic height set up
        tblPlanets.rowHeight = UITableView.automaticDimension
        tblPlanets.estimatedRowHeight = 50.0
        tblPlanets.tableFooterView = UIView()
    }
    
    func getPlanets(){
        //Getting Planets
        planetInteractor?.getPlanets()
    }
    
    func displayPlanets(planets: [Planet]?){
        allPlanets = planets
    }
}

//MARK:- Table Delegates
extension PlanetListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlanets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PlanetCell.id) as? PlanetCell{
            
            if let planetDet = allPlanets?[indexPath.row]{
                cell.lblName.text = planetDet.name
            }else{
                cell.lblName.text = "Planet has not name"
            }
            return cell
        }
        return UITableViewCell()//Default
    }
}
