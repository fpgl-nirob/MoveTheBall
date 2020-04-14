//
//  CircularView.swift
//  Move The Ball
//
//  Created by Nirob Hasan on 4/14/20.
//  Copyright © 2020 Nirob Hasan. All rights reserved.
//

import UIKit

@IBDesignable
class CircularView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height/2
    }
}
