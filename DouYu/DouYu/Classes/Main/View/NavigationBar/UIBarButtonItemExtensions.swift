//
//  UIBarButtonItemExtensions.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/4.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIBarButtonItem 拓展方法

extension UIBarButtonItem {
    // 根据指定图片名称和尺寸构造UIBarButtonItem的便利构造器
    convenience init(_ imageName: String, _ imageNameHL: String? = nil, _ size: CGSize? = nil, _ edgeInsets: UIEdgeInsets? = nil) {
        // body初始化
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false

        // 图片设置
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        if let imageNameHL = imageNameHL { button.setImage(UIImage(named: imageNameHL), for: .highlighted) } // button选中后的高亮图片

        // frame设置
        if let size = size { button.frame = CGRect(origin: CGPoint(), size: size) } else { button.sizeToFit() } // 如果不指定button尺寸就sizeToFit

        // edgeInsets设置
        if let edgeInsets = edgeInsets { button.imageEdgeInsets = edgeInsets }

        self.init(customView: button)
    }
}
