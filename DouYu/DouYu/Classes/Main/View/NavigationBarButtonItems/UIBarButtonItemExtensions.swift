//
//  UIBarButtonItemExtensions.swift
//  DouYu
//
//  Created by 魏卧鱼 on 2020/9/4.
//  Copyright © 2020 魏卧鱼. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
 
    //根据指定图片名称和尺寸构造UIBarButtonItem的便利构造器
    convenience init(_ imageName: String, _ imageNameHL: String? = nil, _ size: CGSize? = nil) {
        
        let button = UIButton()
        
        button.setImage(UIImage(named: imageName), for: .normal)    //button图片
        
        if imageNameHL != nil { button.setImage(UIImage(named: imageNameHL!), for: .highlighted) }  //button选中后的高亮图片
        
        if size != nil {    //如果不指定button尺寸就sizeToFit
            
            button.frame = CGRect(origin: CGPoint(), size: size!)
            
        } else {
            
            button.sizeToFit()
        }
        
        
        
        self.init(customView: button)
    }
    

}
