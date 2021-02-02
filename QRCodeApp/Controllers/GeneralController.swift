
import UIKit

class GeneralController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = .systemPink
        delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let qrCVC = QRCodeViewController()
        let mcVC = MyCArdsController()
        
        let icon1 = UITabBarItem(title: "QRCode", image: UIImage(named: "qr"), selectedImage: UIImage(named: "qr"))
        let icon2 = UITabBarItem(title: "MyCards", image: UIImage(named: "cards"), selectedImage: UIImage(named: "cards"))
        
        qrCVC.tabBarItem = icon1
        mcVC.tabBarItem = icon2
        
        let controllers = [qrCVC, mcVC]
        
        self.viewControllers = controllers
        self.selectedIndex = 0
        

    }
        
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    
    
}
