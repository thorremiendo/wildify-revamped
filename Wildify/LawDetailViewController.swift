//
//  LawDetailViewController.swift
//  Wildify
//
//  Created by Thor Remiendo on 12/1/20.
//  Copyright © 2020 Thor Remiendo. All rights reserved.
//

import UIKit

class LawDetailViewController: UIViewController {

    @IBOutlet weak var lawImage: UIImageView!
    @IBOutlet weak var lawTitle: UITextView!
    @IBOutlet weak var lawDescription: UITextView!
    @IBOutlet weak var lawSource: UITextView!
    
    var selectedLawTitle = ""
    var selectedLawImage = ""
    var selectedLawDescription = ""
    var selectedLawSource = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lawImage.image = UIImage(named: selectedLawImage)
        lawTitle.text = selectedLawTitle
        lawDescription.text = selectedLawDescription
        lawSource.text = selectedLawSource
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
