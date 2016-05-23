//
//  LugarViewController.swift
//  XXIV
//
//  Created by Adrian Camacho Soriano on 10/05/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit

protocol LugarViewControllerDelegate:NSObjectProtocol {
    func openCloseMenu()
}

class LugarViewController: UIViewController {
    
    weak var delegate:LugarViewControllerDelegate?
    
    var lugares = [[String:String]]()
    var personas = [[[String:String]]]()
    
    var indice = [String]()

    let objDAO = DataBase()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)
        
        //obtengo los lugares
        if let temp = objDAO.ejecutarSelect("select lugar from veinticuatro group by lugar") as? [[String:String]] {
            lugares = temp
        }
        
        //obtengo las personas
        for lugar in lugares {
            if let nombreLugar = lugar["lugar"] {
                let query = "SELECT Nombres, Seccion FROM veinticuatro where lugar = '\(nombreLugar)'"
                if let temp = objDAO.ejecutarSelect(query) as? [[String:String]] {
                    personas.append(temp)
                }
                
                //obtengo el indice
                let letras = nombreLugar.characters.prefix(3) // nº de letras en el indice
                indice.append(String(letras))
            }
        }
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        delegate?.openCloseMenu()
    }
}

    // MARK:- Extension

extension LugarViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return lugares.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arrayPersonas = personas[section]
        return arrayPersonas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("celdalug", forIndexPath: indexPath)
        
        let section = indexPath.section
        let row = indexPath.row
        
        let arrayPersonas = personas[section]
        let persona = arrayPersonas[row]
        
        let nombres = persona["Nombres"]
        let seccion = persona["Seccion"]
        
        cell.textLabel?.text = nombres
        cell.detailTextLabel?.text = "\(seccion!)ª Seccion"
        cell.backgroundColor = UIColor(red: 0xfd/255, green: 0xe8/255, blue: 0xd7/255, alpha: 1.0)

        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let lugar = lugares[section]
        return lugar["lugar"]
        
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return indice
    }
}


