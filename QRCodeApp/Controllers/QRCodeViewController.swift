import UIKit

class QRCodeViewController: UINavigationController {
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        
        //MARK:- Views
        
        let firstLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.text = "Please input need text or URL adress"
            return textLabel
        }()
        view.addSubview(firstLabel)
        firstLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let inputTextField: UITextField = {
            let inputTF = UITextField()
            inputTF.translatesAutoresizingMaskIntoConstraints = false
            inputTF.backgroundColor = .lightGray
            return inputTF
        }()
        view.addSubview(inputTextField)
        inputTextField.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: firstLabel.centerXAnchor).isActive = true
        inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        inputTextField.layer.cornerRadius = 10
        inputTextField.textAlignment = .center
        inputTextField.placeholder = "Enter here your text"
        inputTextField.textColor = .white
        
        var myString = inputTextField.text
        
        let generateButton: UIView = {
            let buttonGen = UIButton()
            buttonGen.translatesAutoresizingMaskIntoConstraints = false
            buttonGen.setTitle("Generate QR Code", for: .normal)
            buttonGen.backgroundColor = .systemTeal
            buttonGen.addTarget(self, action: #selector(generateQRCode), for: .touchUpInside)
            
            return buttonGen
        }()
        view.addSubview(generateButton)
        generateButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 10).isActive = true
        generateButton.centerXAnchor.constraint(equalTo: inputTextField.centerXAnchor).isActive = true
        generateButton.widthAnchor.constraint(equalTo: inputTextField.widthAnchor).isActive = true
        generateButton.heightAnchor.constraint(equalTo: generateButton.heightAnchor).isActive = true
        generateButton.layer.cornerRadius = 15
        generateButton.backgroundColor = .systemOrange
        
        
        let qrCodeImage: UIImageView = {
            let qrImage = UIImageView(image: UIImage(named: ""))
            qrImage.translatesAutoresizingMaskIntoConstraints = false
            qrImage.contentMode = .scaleAspectFit
            qrImage.backgroundColor = .black
            
            return qrImage
        }()
        view.addSubview(qrCodeImage)
        qrCodeImage.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 20).isActive = true
        qrCodeImage.centerXAnchor.constraint(equalTo: generateButton.centerXAnchor).isActive = true
        qrCodeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        qrCodeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        qrCodeImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        if let imageQR = qrCodeImage.image {
            let ratio = imageQR.size.width / imageQR.size.height
            qrCodeImage.widthAnchor.constraint(equalTo: qrCodeImage.heightAnchor, multiplier: ratio).isActive = true
        }
        
        
        let saveQRCodeImageButton: UIView = {
            let saveButton = UIButton()
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            saveButton.setTitle("Save QRCode", for: .normal)
            saveButton.backgroundColor = .systemTeal
            saveButton.addTarget(self, action: #selector(saveQRCode), for: .touchUpInside)
            saveButton.layer.cornerRadius = 15
            
            
            return saveButton
        }()
        view.addSubview(saveQRCodeImageButton)
        saveQRCodeImageButton.topAnchor.constraint(equalTo: qrCodeImage.bottomAnchor, constant: 20).isActive = true
        saveQRCodeImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveQRCodeImageButton.widthAnchor.constraint(equalTo: generateButton.widthAnchor).isActive = true
        saveQRCodeImageButton.heightAnchor.constraint(equalTo: generateButton.heightAnchor).isActive = true
        
    }
    
    
    
    
    //MARK:-  Functions
    
    @objc func generateQRCode() {
        
        

       
        let myStringText = inputTextField.text {
        
            let data = myString.data(using: .ascii, allowLossyConversation: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMassage")
            
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            let transformImage = ciImage.applaing(transform)
            
            let image = UIImage(ciImage: transformImage!)
            qrCodeImage.image = image
            
            saveQRCodeImageButton.isEnable = true
            

        }
    
    }
    
    @objc func saveQRCode() {
        
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenShot!, nil, nil, nil)
        
    }
    
   

    

}
