import UIKit

class QRCodeViewController: UINavigationController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var qrCodeImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func genereteCodeButton(_ sender: Any) {
        
      
        
        if let myString = inputTextField.text {
            qrCodeImage.image = generateQRCode(from: inputTextField.text!)
            
        } else {
            qrCodeImage.image = generateQRCode(from: "New")
        }
    }
    @IBAction func saveCodeButton(_ sender: UIButton) {
        
    }
    
    
    
    //MARK:-  Functions
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "InputMassage")
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
        
        
        
    }
    
}






//        let layer = UIApplication.shared.keyWindow!.layer
//        let scale = UIScreen.main.scale
//        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
//
//        layer.render(in: UIGraphicsGetCurrentContext()!)
//        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
//
//        UIGraphicsEndImageContext()
//
//        UIImageWriteToSavedPhotosAlbum(screenShot!, nil, nil, nil)
//

