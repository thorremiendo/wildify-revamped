//
//  SpecieDetailsViewController.swift
//  Wildify
//
//  Created by Thor Remiendo on 11/23/20.
//  Copyright © 2020 Thor Remiendo. All rights reserved.
//

import UIKit

class SpecieDetailsViewController: UIViewController {

    @IBOutlet weak var specieImage: UIImageView!
    @IBOutlet weak var specieLabel: UILabel!
    
    var selectedSpecieName = ""
    var selectedSpecieImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        specieImage.image = UIImage(named: selectedSpecieImage)
        specieLabel.text = selectedSpecieName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
