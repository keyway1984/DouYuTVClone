//
//  MainViewController.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/3.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import UIKit

// MARK: - 主控制器

class MainViewController: UITabBarController {
    // MARK: - outlets

    @IBOutlet var mainNavigationItem: UINavigationItem! // 导航栏项目

    // MARK: - 私有属性

    private lazy var profileIcon: UIButton = { // 个人资料按钮图标
        // frame设定
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        // 图片设置
        let image = UIImage(named: "cm_image_default_eye1")
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        // 手势设置
        button.addTarget(self, action: #selector(profileIsTapped(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var historyIcon: UIButton = { // 历史记录按钮图标
        // frame设定
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        // 图片设置
        let image = UIImage(named: "cm_nav_history_white")
        button.setImage(image, for: .normal)
        let imageHL = UIImage(named: "cm_nav_history_white_HL")
        button.setImage(imageHL, for: .highlighted)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        // 手势设置
        button.addTarget(self, action: #selector(historyIsTapped(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var gameCenterIcon: UIButton = { // 游戏中心按钮图标
        // frame设定
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        // 图片设置
        let image = UIImage(named: "cm_nav_gamecenter_white")
        button.setImage(image, for: .normal)
        let imageHL = UIImage(named: "cm_nav_gamecenter_white_HL")
        button.setImage(imageHL, for: .highlighted)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        // 手势设置
        button.addTarget(self, action: #selector(gameCenterIsTapped(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var searchBar = NavigationSearchBar() // 搜索框

    // MARK: - 生命周期函数

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - 主控制器相关方法

extension MainViewController {
    // 设置UI
    private func setupUI() {
        setupSearchBar()
        setupNavigationBar()
    }

    // 设置导航栏
    private func setupNavigationBar() {
        // 导航栏左边
        let profile = UIBarButtonItem(customView: profileIcon) // 设置个人资料按钮
        mainNavigationItem.leftBarButtonItems = [profile]

        // 导航栏右边
        let history = UIBarButtonItem(customView: historyIcon) // 设置历史记录按钮
        let gameCenter = UIBarButtonItem(customView: gameCenterIcon) // 设置游戏中心按钮
        mainNavigationItem.rightBarButtonItems = [gameCenter, history]

        // 导航栏中间
        mainNavigationItem.titleView = searchBar
    }

    // 设置搜索框
    private func setupSearchBar() {
        // 属性设置
        searchBar.layer.cornerRadius = searchBar.height / 2
        searchBar.layer.masksToBounds = true
        searchBar.backgroundColor = #colorLiteral(red: 0.8826977605, green: 0.8826977605, blue: 0.8826977605, alpha: 1)
        searchBar.isUserInteractionEnabled = true
        // 约束设置
        searchBar.heightAnchor.constraint(equalToConstant: searchBar.height).isActive = true
        // 代理设置
        searchBar.delegate = self
    }
}

// MARK: - 主控制器相关控件手势反馈

// Navigation Items
extension MainViewController {
    // 按下个人资料按钮
    @objc private func profileIsTapped(_: AnyObject) {
        print("profileIsTapped")
    }

    // 按下历史记录按钮
    @objc private func historyIsTapped(_: AnyObject) {
        print("historyIsTapped")
    }

    // 按下游戏中心按钮
    @objc private func gameCenterIsTapped(_: AnyObject) {
        print("gameCenterIsTapped")
    }
}

// titleView
extension MainViewController: NavigationSearchBarDelegate {
    // 点击搜索框
    func navigationSearchBar(_: NavigationSearchBar, searchBoxIsTapped _: UIView) {
        print("searchBoxIsTapped")
    }

    // 点击书签按钮
    func navigationSearchBar(_: NavigationSearchBar, bookmarkButtonIsTapped _: UIView) {
        print("bookmarkButtonIsTapped")
    }
}
