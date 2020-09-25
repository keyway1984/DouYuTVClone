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

// UINavigationItem
extension UINavigationItem {
    // 快速设置导航栏
    func setupNavigationBar(for navigationItem: UINavigationItem) {
        // 导航栏左边
        let profile = UIBarButtonItem("cm_image_default_eye1", nil, nil, UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)) // 设置个人资料按钮
        navigationItem.leftBarButtonItems = [profile]

        // 导航栏右边
        let history = UIBarButtonItem("cm_nav_history_white", "cm_nav_history_white_HL", nil, UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)) // 设置历史记录按钮
        let gameCenter = UIBarButtonItem("cm_nav_gamecenter_white", "cm_nav_gamecenter_white_HL", nil, UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)) // 设置游戏中心按钮
        navigationItem.rightBarButtonItems = [gameCenter, history]

        // 导航栏中间
        let titleView = NavigationSearchBar()
        navigationItem.titleView = titleView

        // 约束设置
        titleView.heightAnchor.constraint(equalToConstant: titleView.height).isActive = true
        // 属性设置
        titleView.layer.cornerRadius = titleView.height / 2
        titleView.layer.masksToBounds = true
        titleView.backgroundColor = #colorLiteral(red: 0.8826977605, green: 0.8826977605, blue: 0.8826977605, alpha: 1)
        titleView.isUserInteractionEnabled = true
    }
}
