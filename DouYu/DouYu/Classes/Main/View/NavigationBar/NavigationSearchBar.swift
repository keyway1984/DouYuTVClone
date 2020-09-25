//
//  NavigationSearchBar.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/4.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 导航栏搜索框类

class NavigationSearchBar: UIView {
    // MARK: - 公有属性

    var height: CGFloat = 28 // 搜索框的高度
    var showsBookmarkButton: Bool = true // 是否显示框内右侧按钮
    override var intrinsicContentSize: CGSize { UIView.layoutFittingExpandedSize } // 让搜索框在Navigation titleView中默认最大尺寸

    // MARK: - 私有属性

    // 搜索框左侧图标
    private lazy var icon: UIImageView = {
        // frame设置
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        // 图片设置
        image.image = UIImage(named: "cm_nav_search_inner")
        image.sizeToFit()

        return image
    }()

    // 搜索框文本框
    private lazy var textbox: UITextField = {
        // frame设置
        let box = UITextField(frame: .zero)
        box.translatesAutoresizingMaskIntoConstraints = false
        // 属性设置
        // FIXME: 如果保证在占位符超过必要宽度的时候让其自动隐藏显示？
        box.placeholder = "Dota2|风行者至宝|不朽3"
        box.font = UIFont.systemFont(ofSize: 11)
        box.textAlignment = .center
        box.isUserInteractionEnabled = false
        box.sizeToFit()

        return box
    }()

    // 右侧按钮
    private lazy var bookmarkButton: UIImageView = {
        // frame设置
        let button = UIImageView(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false

        // 属性设置
        button.image = UIImage(named: "cm_nav_richscan")
        button.sizeToFit()
        button.isUserInteractionEnabled = true

        return button
    }()

    // MARK: - 构造器

    // 指定构造器
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        buildSubViews()
    }

    // 必要构造器
    // 本类不支持从 xib 或者 storyboard 构造
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 子View构建相关方法

extension NavigationSearchBar {
    // UI构建
    private func buildSubViews() {
        createIcon()
        createTextbox()
        if showsBookmarkButton { createBookmarkButton() } // 书签按钮
    }

    // 构建左侧图标
    private func createIcon() {
        addSubview(icon)

        // autolayout约束设置
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }

    // 构建文本框
    private func createTextbox() {
        addSubview(textbox)

        // autolayout约束设置
        NSLayoutConstraint.activate([
            textbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            textbox.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
        ])
    }

    // 构建右侧按钮
    func createBookmarkButton() {
        addSubview(bookmarkButton)

        // autolayout约束设置
        NSLayoutConstraint.activate([
            bookmarkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
