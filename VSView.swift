//
//  VSView.swift
//  Test
//
//  Created by PJ Vea on 8/13/17.
//  Copyright © 2017 Vea Software. All rights reserved.
//

import Foundation
import UIKit

class VSView: UIView {
    
    var contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }
    
    /// The xibSetup method sets up the contentView of the xib.
    func xibSetup() {
        self.contentView = self.loadViewFromXib()
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(self.contentView)
    }
    
    /// The loadViewFromXib method instantiates the view from the xib file.
    ///
    /// - Returns: UIView
    func loadViewFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return UIView()
        }
        return view
    }
}
