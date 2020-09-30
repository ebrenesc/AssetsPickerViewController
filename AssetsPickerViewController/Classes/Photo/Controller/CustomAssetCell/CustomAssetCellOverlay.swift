//
//  CustomAssetCellOverlay.swift
//  Carely
//
//  Created by Esteban Brenes on 9/23/20.
//  Copyright © 2020 Carely. All rights reserved.
//

import UIKit
import SnapKit

class CustomAssetCellOverlay: UIView {
    var isSelected = false {
        didSet {
            self.setupVisibility()
        }
    }
    lazy var circleView: UIView = {
        let view = CircularView()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = UIFont(name: "Avenir-Heavy", size: 9)
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private func setupVisibility() {
        circleView.backgroundColor = isSelected ? .carelyPurple : UIColor.white.withAlphaComponent(0.3)
        countLabel.isHidden = !isSelected
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(circleView)
        addSubview(countLabel)
        self.setupVisibility()
        
        circleView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
