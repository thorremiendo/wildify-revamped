

import UIKit
import CoreML
import Vision



class TestViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
 
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scientificName: UILabel!
    @IBOutlet weak var specieDesc: UILabel!
    
    @IBOutlet weak var notice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.originalImage] as? UIImage {
        
            guard let convertedCIImage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert to CIImage")
            }
            
        detect(image: convertedCIImage)
        
        imageView.image = userPickedImage
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
     
    func detect(image: CIImage){
        guard let model = try? VNCoreMLModel(for: zoohackathon().model) else {
            fatalError("cannot import model")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not classify")
            }
             
            self.navigationItem.title = classification.identifier
            self.requestInfo(animalName: classification.identifier)
        }
        let handler = VNImageRequestHandler(ciImage: image)
        do{
        try handler.perform([request])
        }
        catch {
            print(error)
        }
        
    }
    

    
    func requestInfo(animalName: String){
        
        switch animalName {
        case "Philippine Eagle":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "Also known as the monkey-eating eagle or great Philippine eagle, is an endangered species of eagle of the family Accipitridae endemic to forests in the Philippines. It has brown and white-coloured plumage, and a shaggy crest, and generally measures 86 to 102 cm (2.82 to 3.35 ft) in length and weighs 4.04 to 8.0 kg (8.9 to 17.6 lb)."
            self.scientificName.text = "Pithecophaga jefferyi"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        case "Blue-Naped Parrot":
            self.status.text = "Near Threatened"
            self.specieDesc.text = "Also known as the blue-crowned green parrot, Luzon parrot, the Philippine green parrot, and locally known as pikoy, is a parrot found throughout the Philippines."
            self.scientificName.text = "Tanygnathus lucionensis"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        case "Hill Myna":
            self.status.text = "Population Decreasing"
            self.specieDesc.text = "It is a member of the starling family (Sturnidae), resident in hill regions of South Asia and Southeast Asia."
            self.scientificName.text = "Gracula religiosa"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        case "Hawksbill Turtle":
            self.status.text = "Critically Endangered"
            self.specieDesc.text = "The hawksbill's appearance is similar to that of other marine turtles. In general, it has a flattened body shape, a protective carapace, and flipper-like limbs, adapted for swimming in the open ocean."
            self.scientificName.text = "Eretmochelys imbricata"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        case "Marbled Water Monitor Lizard":
            self.status.text = ""
            self.specieDesc.text = "Philippine water monitor (Varanus marmoratus) is a large species of monitor lizards found in the Philippines. It can reach a total length of 200 cm."
            self.scientificName.text = "Varanus marmoratus"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        case "Palawan Pangolin":
            self.status.text = "Endangered"
            self.specieDesc.text = "Is a pangolin species endemic to the Palawan province of the Philippines. Its habitat includes primary and secondary forests, as well as surrounding grasslands. This species is moderately common within its limited range, but is at risk due to heavy hunting because of its valued scales and meat."
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
            self.scientificName.text = "Manis culionensis"
        default:
            self.status.text = "N/A"
            self.specieDesc.text = "Insert Desctiption"
            self.scientificName.text = "Insert Scientific Name"
            self.notice.text = "It is illegal to capture, sell, or possess wildlife and souvenirs made from their parts. Be a protector of Philippine Wildlife."
        }
        
        
    }

    @IBAction func camera(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    

}
