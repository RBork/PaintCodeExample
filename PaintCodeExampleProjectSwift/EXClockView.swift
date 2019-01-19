//
//  EXClockView.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright © 2015 PixelCut. All rights reserved.
//

import UIKit

@IBDesignable
class EXClockView: UIView
{	
	@IBInspectable var clockColor: UIColor = UIColor.blue
	@IBInspectable var hours: CGFloat = 0
	@IBInspectable var minutes: CGFloat = 0
	@IBInspectable var seconds: CGFloat = 0
	
    override func draw(_ rect: CGRect)
	{
		StyleKit.drawClock(watchColor: self.clockColor,
								  hrs: self.hours,
								 mins: self.minutes,
								 secs: self.seconds)
    }
	

}
