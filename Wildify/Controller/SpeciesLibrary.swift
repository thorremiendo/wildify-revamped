//
//  SpeciesLibrary.swift
//  Wildify
//
//  Created by Thor Remiendo on 09/11/2019.
//  Copyright © 2019 Thor Remiendo. All rights reserved.
//

import UIKit

class SpeciesLibrary: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var specieNames = ["Tamaraw", "Dugong", "Philippine Eagle", "Red-Vented Cockatoo", "Colasisi", "Palawan Forest Turtle", "Giant Golden-crowned Flying Fox", "Visayan Spotted Deer", "Hawksbill Turtle", "Leatherback turtle","Philippine Corcodile ","Panay Forest monitor lizard","Sulu hornbil","Visayan Hornbill","Blue-naped Parrot","Negros bleeding-hoart","Amethyst brown dove","Green Racket-tail","Philippine Pangolin","Palawan Peacock-pheasant","Pinsker's hawk-eagle","Philippine wartly pig","Calamian Deer","Green Turtle","Rufous hornbill","Philippine Eagle-owl","Leopard Cat","Philippine Duck","Common hill myna","Balabac Mouse deer"]
    var specieImages = ["tamaraw", "dugong", "philippine-eagle", "red-vented", "colasisi","palawan-forest","giant-golden","visayan-spotted","hawksbill","leatherback","crocodile","panay-forest","sulu-hornbill","visayan-hornbill","blue-naped","negros-bleeding","amethyst","green-racket","pangolin","palawan-peacock","pinskers","wartly-pig","calamian","green-turtle","rufous","eagle-owl","leopard","duck","hillmyna","balabac",]
    var chosenSpecieName = ""
    var chosenSpecieImage = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        specieNames.append("Tamaraw")
//        specieNames.append("Dugong")
//        specieNames.append("Philippine Eagle")
//        specieNames.append("Red-Vented Cockatoo")
//
//        specieImages.append("tamaraw")
//        specieImages.append("dugong")
//        specieImages.append("philippine-eagle")
//        specieImages.append("red-vented")
        
        navigationItem.title = "Species Library"
        
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell
        cell?.commonInit(specieNames[indexPath.row], specieImages[indexPath.row])
        print(specieNames[indexPath.row], specieImages[indexPath.row])
        return cell!
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

