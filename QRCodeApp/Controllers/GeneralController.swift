
import UIKit

class GeneralController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let qrCVC = QRCodeViewController()
        let settingsVC = SettingsController()
        
        let icon1 = UITabBarItem(title: "QRCode", image: UIImage(named: "qr"), selectedImage: UIImage(named: "qr"))
        let icon2 = UITabBarItem(title: "MyCards", image: UIImage(named: "cards"), selectedImage: UIImage(named: "cards"))
        
        qrCVC.tabBarItem = icon1
        settingsVC.tabBarItem = icon2
        
        let controllers = [qrCVC, settingsVC]
        
        self.viewControllers = controllers
        self.selectedIndex = 0
        

    }
        
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    
    
}
