//
//  EZTableDetailViewController.swift
//  TabBarSample
//
//  Created by John Chou on 2021/2/26.
//

import UIKit

class EZTableDetailViewController: UIViewController {
    private var data: String?
    
    class func getEZTableVC(data: String) -> EZTableDetailViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EZTableDetailViewController") as! EZTableDetailViewController
        vc.data = data
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = data ?? "Title"
    }

}
