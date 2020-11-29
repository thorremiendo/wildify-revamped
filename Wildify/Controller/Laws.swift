//
//  Laws.swift
//  Wildify
//
//  Created by Thor Remiendo on 09/11/2019.
//  Copyright © 2019 Thor Remiendo. All rights reserved.
//

import UIKit
import CardSlider

struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class Laws: UIViewController, CardSliderDataSource {

    @IBOutlet weak var cardButton: UIButton!
    
    var data = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCards()
        data.append(Item(image: UIImage(named: "law-image-1")!,
                         rating: nil,
                         title: "Killing and destroying wildlife species are illegal.",
                         subtitle: " Image Source: https://www.bworldonline.com/denr-calls-on-police-to-probe-deeper-into-illegal-animal-trade/",
                         description: "Fines and Penalties: Imprisonment from 6 months up to 12 years, and/or fines from ₱10,000 to ₱1,000,000, depending on the category of the wildlife species"))
        data.append(Item(image: UIImage(named: "law-image-2")!,
                         rating: nil,
                         title: "Killing and destroying wildlife species are illegal.",
                         subtitle: " Image Source: https://www.bworldonline.com/denr-calls-on-police-to-probe-deeper-into-illegal-animal-trade/",
                         description: "Fines and Penalties: Imprisonment from 6 months up to 12 years, and/or fines from ₱10,000 to ₱1,000,000, depending on the category of the wildlife species"))
        data.append(Item(image: UIImage(named: "law-image-3")!,
                         rating: nil,
                         title: "Killing and destroying wildlife species are illegal.",
                         subtitle: " Image Source: https://www.bworldonline.com/denr-calls-on-police-to-probe-deeper-into-illegal-animal-trade/",
                         description: "Fines and Penalties: Imprisonment from 6 months up to 12 years, and/or fines from ₱10,000 to ₱1,000,000, depending on the category of the wildlife species"))
    }
    
    
    @IBAction func didTapButton(){
        //present cards
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Wildlife Laws"
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
    }
    
    func showCards(){
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Wildlife Laws"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        return data.count
    }
}
    

