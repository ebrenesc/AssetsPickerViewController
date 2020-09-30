//
//  AssetsPhotoViewController+Carely.swift
//  AssetsPickerViewController
//
//  Created by Esteban Brenes on 9/30/20.
//

import Foundation
import Photos

extension AssetsPhotoViewController {

    func carelySetup() {
        self.takeButtonItem.tintColor = .carelyText
        self.cancelButtonItem.tintColor = .carelyText
        if let font = UIFont(name: "Avenir-Medium", size: 16) {
            self.doneButtonItem.setTitleTextAttributes([NSAttributedString.Key.font:font,
                                                        NSAttributedString.Key.foregroundColor: UIColor.carelyPurple],
                                                       for: .normal)
            self.doneButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: font,
                                                        NSAttributedString.Key.foregroundColor: UIColor.carelyLightGray],
                                                       for: .disabled)
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font,
                                                                            NSAttributedString.Key.foregroundColor: UIColor.carelyText]
        }
    }
}

extension AssetsPickerViewControllerDelegate {
    
    func assetsPickerCannotAccessPhotoLibrary(controller: AssetsPickerViewController) {}
    
    func assetsPickerDidCancel(controller: AssetsPickerViewController) {}
    
    func assetsPicker(controller: AssetsPickerViewController, shouldSelect asset: PHAsset, at indexPath: IndexPath) -> Bool {
        return true
    }
    
    func assetsPicker(controller: AssetsPickerViewController, didSelect asset: PHAsset, at indexPath: IndexPath) {}
    
    func assetsPicker(controller: AssetsPickerViewController, shouldDeselect asset: PHAsset, at indexPath: IndexPath) -> Bool {
        return true
    }
    
    func assetsPicker(controller: AssetsPickerViewController, didDeselect asset: PHAsset, at indexPath: IndexPath) {}
    
    func assetsPicker(controller: AssetsPickerViewController, didDismissByCancelling byCancel: Bool) {}
}

extension AssetsPickerViewController {
    public static func picker(assetsMaximumSelectionCount: Int = 7,
                       delegate: AssetsPickerViewControllerDelegate? = nil,
                       showCameraButton: Bool = true) -> AssetsPickerViewController {
        let pickerConfig = AssetsPickerConfig()
        pickerConfig.assetCellType = CustomAssetCell.classForCoder()
        pickerConfig.assetPortraitColumnCount = 3
        pickerConfig.assetLandscapeColumnCount = 5
        pickerConfig.assetsMaximumSelectionCount = assetsMaximumSelectionCount
        pickerConfig.assetIsShowCameraButton = showCameraButton
        pickerConfig.albumIsShowEmptyAlbum = false
        let picker = AssetsPickerViewController()
        picker.pickerConfig = pickerConfig
        return picker
    }
}
