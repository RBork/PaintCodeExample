//
//  EXAnimationViewController.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright (c) 2015 PixelCut. All rights reserved.
//

import UIKit

class EXAnimationViewController: UIViewController {

	@IBOutlet weak var buttonView: UIView!
	@IBOutlet var clockViews : [EXClockView]!
	let EX_BASIC_ANIMATION = "EX_BASIC_ANIMATION"
	fileprivate let animatedLayer :  EXAnimationLayer = EXAnimationLayer()
	fileprivate var clockTimer : Timer!

    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		animatedLayer.setNeedsDisplay()
    }
	
	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
		
		//Animated Button
		animatedLayer.contentsScale = UIScreen.main.scale
		animatedLayer.frame = CGRect(x: (buttonView.frame.size.width - 100.0)/2.0, y: (buttonView.frame.size.height - 100.0)/2.0, width: 100.0, height: 100.0)
		animatedLayer.setValue(false, forKey: "state")
		buttonView.layer.addSublayer(animatedLayer)
		
		
		//Animated Clock
		updateClock()
		clockTimer = Timer.scheduledTimer( timeInterval: 1.0, target: self, selector: #selector(EXAnimationViewController.updateClock), userInfo: nil, repeats: true)
	}
	
	override func viewDidDisappear(_ animated: Bool)
	{
		super.viewDidDisappear(animated)
		clockTimer.invalidate()
		clockTimer = nil
	}
	
	@IBAction func animateButton(_ sender : AnyObject)
	{
		let layerState : Bool = !((animatedLayer.value(forKey: "state") as AnyObject).boolValue)!
		let duration = 1.0
		let timing : CAMediaTimingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
		let color = (layerState ? UIColor.red.cgColor : UIColor.white.cgColor )
		let width : CGFloat = (layerState ? 15.0 : 5.0)
		let radius : CGFloat = (layerState ? 25.0 : 5.0)
		
//	Implicit animation - START

		CATransaction.begin()
		CATransaction.setAnimationDuration(duration)
		CATransaction.setAnimationTimingFunction(timing)
		animatedLayer.color = color
		animatedLayer.width = width
		animatedLayer.radius = radius
		CATransaction.commit()

//	Implicit animation - END

		
//	Explicit animation - START
//  Please, uncomment animationDidStop: too.
/*
		let animationColor = CABasicAnimation(keyPath: "color")
		animationColor.fromValue = (animatedLayer.presentationLayer() as! EXAnimationLayer).color
		animationColor.toValue = color

		let animationWidth = CABasicAnimation(keyPath: "width")
		animationWidth.fromValue = (animatedLayer.presentationLayer() as! EXAnimationLayer).width
		animationWidth.toValue = width
		
		let animationRadius = CABasicAnimation(keyPath: "radius")
		animationRadius.fromValue = (animatedLayer.presentationLayer() as! EXAnimationLayer).radius
		animationRadius.toValue = radius
		
		let animationGroup = CAAnimationGroup()
		animationGroup.animations = [animationColor, animationWidth, animationRadius]
		animationGroup.timingFunction = timing
		animationGroup.fillMode = kCAFillModeBoth
		animationGroup.removedOnCompletion = false
		animationGroup.duration = duration
		animationGroup.delegate	= self
		animationGroup.setValue(true, forKey: EX_BASIC_ANIMATION)
		
		animatedLayer.addAnimation(animationGroup, forKey: EX_BASIC_ANIMATION)
*/
		
		//KVC helps us to keep the state of the layer:
		animatedLayer.setValue(layerState, forKey: "state")

	}

//Uncomment animationDidStop: method for "Explicit Animation" only
//To prevent layer from continuous drawing at the end of the animation,
//we will set the model values and remove the animation completely
/*
	 override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
		
		if flag
		{
			if (anim.valueForKey(EX_BASIC_ANIMATION) != nil)
			{
				animatedLayer.color	 = (animatedLayer.presentationLayer() as? EXAnimationLayer)!.color
				animatedLayer.width	 = (animatedLayer.presentationLayer() as? EXAnimationLayer)!.width
				animatedLayer.radius = (animatedLayer.presentationLayer() as? EXAnimationLayer)!.radius
				animatedLayer.removeAnimationForKey(EX_BASIC_ANIMATION)
			}
		}
	}
*/
	
	func updateClock()
	{
		let calendar = Calendar.current
		let today = (calendar as NSCalendar).components([NSCalendar.Unit.hour , NSCalendar.Unit.minute , NSCalendar.Unit.second], from: Date())
		
		for clockView in self.clockViews
		{
			clockView.hours = CGFloat(today.hour!)
			clockView.minutes = CGFloat(today.minute!)
			clockView.seconds = CGFloat(today.second!)
			
			clockView.setNeedsDisplay()
		}
	}

}
