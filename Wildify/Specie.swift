//
//  Specie.swift
//  Wildify
//
//  Created by Thor Remiendo on 11/30/20.
//  Copyright © 2020 Thor Remiendo. All rights reserved.
//

import Foundation

class Specie {
    var name : String
    var image : String
    var description : String
    
    init(specieName: String, specieImage: String, specieDescription: String){
        name = specieName
        image = specieImage
        description = specieDescription
    }
}
