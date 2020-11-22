//
//  SpeciesLibrary.swift
//  Wildify
//
//  Created by Thor Remiendo on 09/11/2019.
//  Copyright © 2019 Thor Remiendo. All rights reserved.
//

import UIKit

class SpeciesLibrary: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var specieNames = [String]()
    var specieImages = [UIImage]()
    var chosenSpecieName = ""
    var chosenSpecieImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        specieNames.append("Tamaraw")
        specieNames.append("Dugong")
        specieNames.append("Philippine Eagle")
        specieNames.append("Red-Vented Cockatoo")
        
        specieImages.append(UIImage(named: "tamaraw.jpg")!)
        specieImages.append(UIImage(named: "dugong")!)
        specieImages.append(UIImage(named: "philippine-eagle.jpg")!)
        specieImages.append(UIImage(named: "red-vented.jpg")!)
        
        navigationItem.title = "Species Library"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = specieNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specieNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSpecieName = specieNames[indexPath.row]
        chosenSpecieImage = specieImages[indexPath.row]
        
        performSegue(withIdentifier: "toSpecieDetailsViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSpecieDetailsViewController" {
            let destinationVC = segue.destination as! SpecieDetailsViewController
            destinationVC.selectedSpecieImage = chosenSpecieImage
            destinationVC.selectedSpecieName = chosenSpecieName
        }
    }
}
