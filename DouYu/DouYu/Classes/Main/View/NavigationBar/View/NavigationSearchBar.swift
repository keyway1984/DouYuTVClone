//
//  NavigationSearchBar.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/4.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 相关协议

// 交互反馈
protocol NavigationSearchBarDelegate: AnyObject {
    // 点击了搜索框
    func navigationSearchBar(_ searchBar: NavigationSearchBar, searchBoxIsTapped: UIView)
    // 点击了书签按钮
    func navigationSearchBar(_ searchBar: NavigationSearchBar, bookmarkButtonIsTapped: UIView)
}

// MARK: - 主导航栏搜索框

class NavigationSearchBar: UIView {
    // MARK: - 代理引用

    weak var delegate: NavigationSearchBarDelegate?

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
    private lazy var textbox: UILabel = {
        // frame设置
        let box = UILabel(frame: .zero)
        box.translatesAutoresizingMaskIntoConstraints = false
        // 属性设置
        // FIXME: 如果保证在占位符超过必要宽度的时候让其自动隐藏显示？
        box.text = "占位符"
        box.font = UIFont.systemFont(ofSize: 11)
        box.sizeToFit()
        box.textColor = #colorLiteral(red: 0.6768371463, green: 0.6769364476, blue: 0.6768154502, alpha: 1)
        box.textAlignment = .left
        box.isUserInteractionEnabled = true

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
    // 指定托管对象构造
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
        if showsBookmarkButton { createBookmarkButton() }
        createTextbox()
    }

    // 构建左侧图标
    private func createIcon() {
        addSubview(icon)

        // autolayout约束设置
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            icon.widthAnchor.constraint(equalToConstant: icon.frame.width),
        ])
    }

    // 构建书签按钮
    func createBookmarkButton() {
        addSubview(bookmarkButton)

        // 设置手势
        setupTapGesture(to: bookmarkButton, action: #selector(bookmarkButtonIsTapped(_:)))

        // autolayout约束设置
        NSLayoutConstraint.activate([
            bookmarkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bookmarkButton.widthAnchor.constraint(equalToConstant: bookmarkButton.frame.width),
        ])
    }

    // 构建文本框
    private func createTextbox() {
        addSubview(textbox)

        // 设置手势
        setupTapGesture(to: textbox, action: #selector(searchBoxIsTapped(_:)))

        // 根据书签按钮是否显示而设置不同的trailing 锚点对象
        let targetAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor> = showsBookmarkButton ? bookmarkButton.leadingAnchor : trailingAnchor
        let constant: CGFloat = showsBookmarkButton ? -5 : -10

        // autolayout约束设置
        NSLayoutConstraint.activate([
            textbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            textbox.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            textbox.trailingAnchor.constraint(equalTo: targetAnchor, constant: constant),
        ])
    }
}

// MARK: - 交互相关方法

extension NavigationSearchBar {
    // 设置单击手势
    private func setupTapGesture(to target: UIView, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        tapGesture.numberOfTouchesRequired = 1
        target.addGestureRecognizer(tapGesture)
        target.isUserInteractionEnabled = true
    }

    // 手势反馈
    // 单击搜索框触发
    @objc private func searchBoxIsTapped(_: AnyObject) {
        delegate?.navigationSearchBar(self, searchBoxIsTapped: textbox)
    }

    // 单击搜索框书签按钮触发
    @objc private func bookmarkButtonIsTapped(_: AnyObject) {
        delegate?.navigationSearchBar(self, bookmarkButtonIsTapped: bookmarkButton)
    }
}
