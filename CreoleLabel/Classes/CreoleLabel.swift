//
//  CreoleLabel.swift
//
//
//  Created by Nirmalsinh Rathod on 06/08/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
@IBDesignable
class CreoleLabel: UILabel {
    var _topInset:CGFloat = 0.0
    var _bottomInset:CGFloat = 0.0
    var _leftInset:CGFloat = 0.0
    var _rightInset:CGFloat = 0.0
    //MARK: - inspactable
    
    //set corner radius
    @IBInspectable public var cornerRadius: CGFloat = 1.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    
    @IBInspectable public var topInset: CGFloat = 0.0{
        didSet{
            self._topInset = topInset
        }
    }
    @IBInspectable public var bottomInset: CGFloat = 0.0{
        didSet{
            self._bottomInset = bottomInset
        }
    }
    @IBInspectable public var leftInset: CGFloat = 0.0{
        didSet{
            self._leftInset = leftInset
        }
    }
    @IBInspectable public var rightInset: CGFloat = 0.0{
        didSet{
            self._rightInset = rightInset
        }
    }
    
    //MARK: - Initialization
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLabel()
    }
    
    //MARK: - setView
    
    public func setLabel()
    {
        //set other property of label directly,so you not need to set property again and again when multiple customlabel.
        self.textAlignment = .center
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
         let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        var rect = super.textRect(forBounds: UIEdgeInsetsInsetRect(bounds, edgeInsets), limitedToNumberOfLines: numberOfLines)
        
        rect.origin.x -= edgeInsets.left
        rect.origin.y -= edgeInsets.top
        rect.size.width  += (edgeInsets.left + edgeInsets.right);
        rect.size.height += (edgeInsets.top + edgeInsets.bottom);
        
        return rect
    }
    
    override public func drawText(in rect: CGRect) {
        let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, edgeInsets))
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
