import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([PresentViewController(), PushViewController()].map({UINavigationController(rootViewController: $0)}), animated: true)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}

