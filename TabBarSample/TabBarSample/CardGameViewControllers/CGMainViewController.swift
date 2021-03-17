//
//  CGMainViewController.swift
//  TabBarSample
//
//  Created by John Chou on 2021/3/16.
//

import UIKit

struct card {
    let number: Int!
    let color: CGCardColor!
}

class CGMainViewController: UIViewController {
    @IBOutlet weak var playerCardsContainerView: UIView!
    @IBOutlet weak var addCardButton: UIButton!
    enum cardZone: Int { case banker, player}
    var playerCards: [card] = []
    class func getCGMainViewController() -> CGMainViewController {
        let vc = UIStoryboard.init(name: "CGMainViewController", bundle: nil).instantiateViewController(withIdentifier: "CGMainVC") as! CGMainViewController
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setupUI() {
        addCardButton.addRoundCorners(color: .magenta, width: 1, radius: 10)
    }
    func addCardTo(_ zone: cardZone) {
        if playerCards.count < 5 {
            let leadingPadding = 15, topPadding = 10, cardNumberWidth = 40
            let newCard = card(number: Int.random(in: 0...12), color: CGCardColor(rawValue: Int.random(in: 0...3)))
            let newCardView = CGCardView(frame: CGRect(x: leadingPadding + playerCards.count * cardNumberWidth, y: topPadding, width: 150, height: 200))
            playerCards.append(newCard)
            newCardView.setupInfo(number: newCard.number, color: newCard.color)
            playerCardsContainerView.addSubview(newCardView)
        }
        
        
    }
    @IBAction func addCardButtonTapped(_ sender: Any) {
        addCardTo(.player)
    }
}
