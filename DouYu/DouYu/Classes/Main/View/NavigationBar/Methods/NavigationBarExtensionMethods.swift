//
//  UIBarButtonItemExtensions.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/4.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 主导航栏相关拓展方法

// UIBarButtonItem
extension UIBarButtonItem {
    // 根据指定图片名称和尺寸构造UIBarButtonItem的便利构造器
    convenience init(_ imageName: String, _ imageNameHL: String? = nil, _ edgeInset: CGFloat? = nil, _ target: Any?, action: Selector) {
        // button初始化
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false

        // 图片设置
        button.setImage(UIImage(named: imageName), for: .normal)
        if let imageNameHL = imageNameHL { button.setImage(UIImage(named: imageNameHL), for: .highlighted) } // button选中后的高亮图片
        button.imageView?.contentMode = .scaleAspectFit

        // edgeInsets设置
        if let edgeInset = edgeInset { button.imageEdgeInsets = UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset) }

        // 手势设置
        button.addTarget(target, action: action, for: .touchUpInside)

        self.init(customView: button)
    }
}
