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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayoutConstriant: NSLayoutConstraint!
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Collection View 的內容變動時會被叫用，取得內容大小，調整我們為它設定的LayoutConstriant.constant
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewLayoutConstriant.constant = height
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

extension EZShareViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 0...20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        return cell
    }
    
    
}
