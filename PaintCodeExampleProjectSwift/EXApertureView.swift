//
//  EXApertureView.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright © 2015 PixelCut. All rights reserved.
//

import UIKit

class EXApertureLayer: CALayer
{
	
	@NSManaged var apertureValue : CGFloat

	override init()
	{
		super.init()
		apertureValue = 0.0
	}
	
	override init(layer: Any)
	{
		super.init(layer: layer)
		
		if let layer = layer as? EXApertureLayer
		{
			apertureValue = layer.apertureValue
		}
		
	}

	
	override class func needsDisplay(forKey key: String) -> Bool
	{

		if key == "apertureValue"
		{
			return true
		}
		
		return super.needsDisplay(forKey: key)
	}
	
	override func action(forKey event: String) -> CAAction?
	{
		if event == "apertureValue"
		{
			let animation = CABasicAnimation.init(keyPath: event)
			animation.fromValue = presentation()?.value(forKey: event)
			return animation
		}
		
		return super.action(forKey: event)
	}

	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}


class EXApertureView: UIView
{
	var open: Bool = false
	{
		willSet
		{
			if newValue != open
			{
                animateTo(newValue ? 1 : 0)
			}
		}
	}

	
	override class var layerClass : AnyClass
	{
		return EXApertureLayer.self
	}
	
	override func awakeFromNib()
	{
		open = false
		layer.contentsScale = UIScreen.main.scale
		layer.setNeedsDisplay()
	}
	
	func animateTo(_ toValue: CGFloat)
	{
		let timing : CAMediaTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
		let duration = 1.0

		
//	Implicit animation - START
/*
		CATransaction.begin()
		CATransaction.setAnimationDuration(duration)
		CATransaction.setAnimationTimingFunction(timing)
		(layer as! EXApertureLayer).apertureValue = toValue
		CATransaction.commit()
*/
//	Implicit animation - END


//	Explicit animation - START
		
		let theAnimation = CABasicAnimation(keyPath: "apertureValue")
		theAnimation.isAdditive = true
		theAnimation.duration = duration
		theAnimation.fillMode = kCAFillModeBoth
		theAnimation.timingFunction = timing
		theAnimation.fromValue = (layer as! EXApertureLayer).apertureValue - toValue
		theAnimation.toValue = 0
		layer.add(theAnimation, forKey: nil)

		CATransaction.begin()
		CATransaction.setDisableActions(true)
		(layer as! EXApertureLayer).apertureValue = toValue
		CATransaction.commit()
		
//	Explicit animation - END
		
	}
	
	
	override func draw(_ layer: CALayer, in ctx: CGContext)
	{
		UIGraphicsPushContext(ctx)
			StyleKit.drawAperture(apertureValue: (layer as! EXApertureLayer).apertureValue )
		UIGraphicsPopContext()
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		open = !open
	}

	
}
