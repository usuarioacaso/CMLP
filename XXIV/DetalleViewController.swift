//
//  DetalleViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var miTableView: UITableView!
    
    var data1:String!
    var datosBD = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objDAO = DataBase()
        
        if data1 == "PRIMERA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '1'")
        }
        
        if data1 == "SEGUNDA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '2'")
        }
        
        if data1 == "TERCERA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '3'")
        }
        
        if data1 == "CUARTA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '4'")
        }
        
        if data1 == "QUINTA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '5'")
        }
        
        if data1 == "SEXTA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '6'")
        }
        
        if data1 == "SEPTIMA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '7'")
        }
        
        if data1 == "OCTAVA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '8'")
        }
        
        if data1 == "NOVENA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '9'")
        }
        
        if data1 == "DECIMA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '10'")
        }
        
        if data1 == "UNDECIMA" {
            datosBD = objDAO.ejecutarSelect("SELECT nombres FROM veinticuatro WHERE seccion = '11'")
        }
    }
}

extension DetalleViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosBD.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = miTableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        let nombre = datosBD[indexPath.row]["Nombres"] as! NSString
        cell.primeraCelda.text = nombre as String
        cell.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
        return cell
    }
}
