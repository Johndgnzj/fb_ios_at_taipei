//
//  EZTabBarViewController.swift
//  TabBarSample
//
//  Created by John Chou on 2021/2/23.
//

import UIKit

class EZTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            createNavigationController(title: "Home", background: .blue, icon: "house"),
            createNavigationController(title: "Payment", background: .brown, icon: "creditcard"),
            createNavigationController(title: "Search", background: .white, icon: "magnifyingglass"),
            createNavigationController(title: "Profile", background: .cyan, icon: "person.circle"),
            createNavigationController(title: "Promotion", background: .orange, icon: "cart")
        ]
    }
    
    func createNavigationController(title: String, background: UIColor, icon: String) -> UINavigationController {
        let vc = createViewController(title: title)
        vc.title = title
        vc.view.backgroundColor = background
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage.init(systemName:icon)
        nav.tabBarItem.title = title
        return nav
    }
    
    func createViewController(title: String) -> UIViewController {
        switch title {
        case "Profile":
            return EZTableViewController.getEZTableVC()
        case "Search":
            let vc = EZShareViewController.getShareViewController(data: title, displayMode: .search)
            vc.buttonClickActionHandler = {
                let controller = UIAlertController(title: "加入讀書會", message: "是否要走上這條不歸路 ?", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好的", style: .default) { (_) in
//                   print("做些其它API呼叫之類的")
                }
                controller.addAction(okAction)
                let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                controller.addAction(cancelAction)
                vc.present(controller, animated: true, completion: nil)
            }
            return vc
        case "Payment":
            let vc = EZShareViewController.getShareViewController(data: title, displayMode: .create)
            vc.buttonClickActionHandler = {
                let controller = UIAlertController(title: "成立讀書會", message: "開發一個讓世界更美好的APP!!!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好的", style: .default) { (_) in
//                   print("做些其它API呼叫之類的")
                }
                controller.addAction(okAction)
                let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                controller.addAction(cancelAction)
                vc.present(controller, animated: true, completion: nil)
            }
            return vc
        default:
            return UIViewController()
        }
    }
}
