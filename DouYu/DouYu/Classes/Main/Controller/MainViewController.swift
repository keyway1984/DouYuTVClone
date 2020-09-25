//
//  MainViewController.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/3.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    // MARK: - outlets

    @IBOutlet var mainNavigationItem: UINavigationItem! // 导航栏

    // MARK: - 初始化函数

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - 相关方法

extension MainViewController {
    // 设置UI
    private func setupUI() {
        setupNavigationBar()
    }

    // 设置导航栏
    private func setupNavigationBar() {
        // 导航栏左边
        let profile = UIBarButtonItem("cm_image_default_eye1", nil, nil, UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)) // 设置个人资料按钮
        mainNavigationItem.leftBarButtonItems = [profile]

        // 导航栏右边
        let history = UIBarButtonItem("cm_nav_history_white", "cm_nav_history_white_HL", nil, UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)) // 设置历史记录按钮
        let gameCenter = UIBarButtonItem("cm_nav_gamecenter_white", "cm_nav_gamecenter_white_HL", nil, UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)) // 设置游戏中心按钮
        mainNavigationItem.rightBarButtonItems = [gameCenter, history]

        // 导航栏中间
        let titleView = NavigationSearchBar()
        mainNavigationItem.titleView = titleView

        // 约束设置
        titleView.heightAnchor.constraint(equalToConstant: titleView.height).isActive = true
        // 属性设置
        titleView.layer.cornerRadius = titleView.height / 2
        titleView.layer.masksToBounds = true
        titleView.backgroundColor = #colorLiteral(red: 0.8826977605, green: 0.8826977605, blue: 0.8826977605, alpha: 1)
        titleView.isUserInteractionEnabled = true
    }
}
