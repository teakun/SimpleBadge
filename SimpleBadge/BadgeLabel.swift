//
//  BadgeLabel.swift
//  SimpleBadge
//
//  Created by teakun on 2019/09/24.
//  Copyright © 2019 kittengine.com. All rights reserved.
//

import UIKit

class BadgeLabel: UILabel {
    var insets: CGSize = CGSize(width: 4, height: 2) {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    var badgeColor: UIColor = UIColor.red
    
    convenience public init() {
        self.init(frame: CGRect())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        textAlignment = .center
        clipsToBounds = false
        font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        // 現状の文字サイズのrectを取得
        let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        
        // insetを使って拡張したrectを作る
        var targetInsets = CGSize(width: insets.width, height: insets.height)
        let rectWithDefaultInsets = rect.insetBy(dx: -targetInsets.width, dy: -targetInsets.height)
        
        // もし幅よりも高さよりも大きい場合は丸く見えるようにinsetsを調整する
        if rectWithDefaultInsets.width < rectWithDefaultInsets.height {
            targetInsets.width = (rectWithDefaultInsets.height - rect.width) / 2
        }
        let result = rect.insetBy(dx: -targetInsets.width, dy: -targetInsets.height)
        
        return result
    }
    
    override func drawText(in rect: CGRect) {
        layer.cornerRadius = rect.height / 2
        let insetsValue = self.insets
        
        let edgeInsets = UIEdgeInsets(top: insetsValue.height,
                                      left: insetsValue.width,
                                      bottom: insetsValue.height,
                                      right: insetsValue.width)
        let rectWithoutInsets = rect.inset(by: edgeInsets)
        super.drawText(in: rectWithoutInsets)
    }
    
    override func draw(_ rect: CGRect) {
        let cornerRadius = rect.height / 2
        
        let path: UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        badgeColor.setFill()
        path.fill()
        
        super.draw(rect)
    }
}
