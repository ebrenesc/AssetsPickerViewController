//
//  CircularView.swift
//  AssetsPickerViewController
//
//  Created by Esteban Brenes on 9/30/20.
//


import UIKit
open class CircularView: UIView, FullyRounded {
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.makeCornersFullyRoundedIfNecessary()
    }
}

public class CircularLabel: UILabel, FullyRounded {
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.makeCornersFullyRoundedIfNecessary()
    }
}

public class CircularButton: UIButton, FullyRounded {
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.makeCornersFullyRoundedIfNecessary()
    }
}

public class CircularImageView: UIImageView, FullyRounded {
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.makeCornersFullyRoundedIfNecessary()
    }
}

public protocol FullyRounded {
    func makeCornersFullyRoundedIfNecessary()
}

public extension FullyRounded where Self: UIView {
    func makeCornersFullyRoundedIfNecessary() {
        let fullyRoundedRadius = self.bounds.height / 2.0
        if self.layer.cornerRadius != fullyRoundedRadius {
            self.layer.cornerRadius = fullyRoundedRadius
            self.clipsToBounds = true
        }
    }
}
