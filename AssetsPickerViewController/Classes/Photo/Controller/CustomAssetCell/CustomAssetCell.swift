//
//  CustomAssetCell.swift
//  AssetsPickerViewController
//
//  Created by Esteban Brenes on 9/30/20.
//

import Photos
import UIKit

class CustomAssetCell: UICollectionViewCell, AssetsPhotoCellProtocol {
    
    // MARK: - AssetsAlbumCellProtocol
    var asset: PHAsset? {
        didSet {}
    }
    
    var isVideo: Bool = false
    
    override var isSelected: Bool {
        didSet { overlay.isSelected = isSelected }
    }
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        return view
    }()
    
    var count: Int = 0 {
        didSet { overlay.countLabel.text = "\(count)" }
    }
    
    var duration: TimeInterval = 0
    
    // MARK: - At your service
    
    let overlay = CustomAssetCellOverlay()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(imageView)
        contentView.addSubview(overlay)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        overlay.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
