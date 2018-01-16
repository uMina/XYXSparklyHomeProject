//
//  XYXSearchHeaderView.swift
//  XYXTransformationHome
//
//  Created by Teresa on 2017/6/21.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import Foundation
import UIKit

class XYXSearchHeaderView: UIView {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var gradedView: UIView!
    
    override var frame: CGRect{
        didSet{
            configureSetting()
        }
    
    }
    var aspectRatio:CGFloat = 0
    var originRect = CGRect.zero
    
    override func awakeFromNib() {
        configureSetting()
    }
    
    fileprivate func configureSetting(){
        aspectRatio = UIScreen.main.bounds.width / frame.height
        originRect = CGRect(origin:CGPoint(x:0,y:0),size:CGSize(width:UIScreen.main.bounds.width,height:frame.height))
    }
    
    var alphaScale: CGFloat? {
        didSet {
            gradedView.backgroundColor = UIColor.init(red: 245.0/255, green: 226.0/255, blue: 228.0/255, alpha: alphaScale!)
        }
    }
    
    
    var offsetY: CGFloat?{
        didSet {
            if let offset = offsetY{
                if offset < 0 {
                    let height = originRect.height - offset
                    let width = height * self.aspectRatio
                    self.backgroundImageView.frame = CGRect(origin:CGPoint(x:(originRect.size.width - width) / 2,y:offset),size:CGSize(width:width,height:height))
                    
                }else{
                    self.backgroundImageView.frame = originRect
                }
            }
        }
    }
}
