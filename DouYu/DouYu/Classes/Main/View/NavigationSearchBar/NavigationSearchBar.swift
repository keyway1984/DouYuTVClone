//
//  NavigationSearchBar.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/4.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import UIKit
import Foundation


class NavigationSearchBar: UIView {
    
    //MARK: - 相关变量
    var height: CGFloat = 30    //搜索框的高度
    var showsBookmarkButton: Bool = true   //是否显示右侧扫描按钮
    
    override var intrinsicContentSize: CGSize { return UIView.layoutFittingExpandedSize }   //让搜索框在Navigation titleView中默认最大尺寸
    
    
    //MARK: - 相关构造器
    //指定frame来初始化view
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    //从 xib 或者 storyboard 初始化view
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    //便利初始化器
    convenience init(height: CGFloat, showsBookmarkButton: Bool) {
    
        self.init()
        self.height = height
        self.showsBookmarkButton = showsBookmarkButton
        setupView()
    }

    //自定义初始化内容
    private func setupView() {
        
        setupSearchModel()  //搜索模块
        
        if showsBookmarkButton { setupBookmarkButton() }    //书签按钮
    }
    
    
    //MARK: - 相关构造函数
    func setupSearchModel() {
        
        //设置container
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.layer.cornerRadius = height / 2
        self.layer.masksToBounds = true
        self.backgroundColor = #colorLiteral(red: 0.8826977605, green: 0.8826977605, blue: 0.8826977605, alpha: 1)
        self.isUserInteractionEnabled = true
        
        
        //添加searchBar左侧🔍图标
        let icon = UIImageView(image: UIImage(named: "cm_nav_search_inner"))
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(icon)
        
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
        
        
        //添加searchBar文本框
        let textbox = UITextField()
        textbox.placeholder = "Dota2|风行者至宝|不朽3"
        textbox.font = UIFont.systemFont(ofSize: 13)
        textbox.textAlignment = .center
        textbox.isUserInteractionEnabled = false
        textbox.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textbox)
        
        NSLayoutConstraint.activate([
            
            textbox.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textbox.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5)
        ])
    }
    
    
    func setupBookmarkButton() {
        
        let button = UIButton()
        button.setImage(UIImage(named: "cm_nav_richscan"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
