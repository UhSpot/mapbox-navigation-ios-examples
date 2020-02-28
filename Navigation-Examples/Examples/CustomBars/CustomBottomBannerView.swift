//
//  CustomBottomBannerView.swift
//  Navigation-Examples
//
//  Created by Viktor Kononov on 2/28/20.
//  Copyright © 2020 Mapbox. All rights reserved.
//

import UIKit
import MapboxNavigation

protocol CustomBottomBannerViewDelegate: class {
    func customBottomBannerDidCancel(_ banner: CustomBottomBannerView)
}

class CustomBottomBannerView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var etaLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var cancelButton: UIButton!
    
    var progress: Float {
        get {
            return progressBar.progress
        }
        set {
            progressBar.setProgress(newValue, animated: false)
        }
    }
    
    var eta: String? {
        get {
            return etaLabel.text
        }
        set {
            etaLabel.text = newValue
        }
    }
    
    weak var delegate: CustomBottomBannerViewDelegate?
    
    private func initFromNib() {
        Bundle.main.loadNibNamed(String(describing: CustomBottomBannerView.self),
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        progressBar.progressTintColor = .systemGreen
        progressBar.layer.borderColor = UIColor.black.cgColor
        progressBar.layer.borderWidth = 2
        progressBar.layer.cornerRadius = 5
        
        cancelButton.backgroundColor = .systemGray
        cancelButton.layer.cornerRadius = 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initFromNib()
    }
    
    @IBAction @objc func onCancel(_ sender: Any) {
        delegate?.customBottomBannerDidCancel(self)
    }
}
