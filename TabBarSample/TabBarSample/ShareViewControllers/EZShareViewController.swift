//
//  EZShareViewController.swift
//  TabBarSample
//
//  Created by John Chou on 2021/3/3.
//

import UIKit
enum EZSomeType: Int {case search, create}
class EZShareViewController: UIViewController {
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var createContainerView: UIView!
    var data: String?
    var displayMode: EZSomeType = .search
    var buttonClickActionHandler: (() -> Void)?
    
    class func getShareViewController(data: String, displayMode: EZSomeType) -> EZShareViewController {
        let vc = UIStoryboard.init(name: "EZShareViewController", bundle: nil).instantiateViewController(withIdentifier: "EZShareVC") as! EZShareViewController
        vc.data = data
        vc.displayMode = displayMode
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = data
        setupUI()
    }
    func setupUI() {
        searchContainerView.isHidden = !(displayMode == .search)
        createContainerView.isHidden = !(displayMode == .create)
    }
    
    @IBAction func onCreateButtonTapped(_ sender: Any) {
        if buttonClickActionHandler != nil {
            buttonClickActionHandler!()
        }
    }
    @IBAction func onSearchButtonTapped(_ sender: Any) {
        if buttonClickActionHandler != nil {
            buttonClickActionHandler!()
        }
    }
}
