//
//  CGCardView.swift
//  TabBarSample
//
//  Created by John Chou on 2021/3/16.
//

import UIKit

enum CGCardColor: Int {case spade, heart, diamond, club}
class CGCardView: UIView, NibOwnerLoadable {
    @IBOutlet weak var topCardNumberLabel: UILabel!
    @IBOutlet weak var topCardColorLabel: UILabel!
    @IBOutlet weak var bottomCardNumberLabel: UILabel!
    @IBOutlet weak var bottomCardColorLabel: UILabel!

    let numbers = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initUI()
    }
    func initUI() {
        loadNibContent()
        self.addRoundCorners(color: .darkGray, width: 1, radius: 15)
        self.dropShadow(color: .black, offSet: CGSize(width: 1, height: 1))
        self.layer.backgroundColor = UIColor.systemGray5.cgColor
    }
    func setupInfo(number: Int, color: CGCardColor) {
        topCardNumberLabel.text = numbers[number]
        topCardNumberLabel.textColor = getNumberColor(color)
        topCardColorLabel.text = getColorEmoji(color)
        bottomCardNumberLabel.text = numbers[number]
        bottomCardNumberLabel.textColor = getNumberColor(color)
        bottomCardColorLabel.text = getColorEmoji(color)
        
    }
    func getNumberColor(_ color: CGCardColor) -> UIColor {
        if color == .diamond || color == .heart {
            return .red
        } else {
            return .black
        }
    }
    func getColorEmoji(_ color: CGCardColor) -> String {
        switch color {
        case .spade:
            return "♠️"
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .club:
            return "♣️"
        }
    }
}
