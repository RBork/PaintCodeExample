//
//  EXBasicViewOne.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright © 2015 PixelCut. All rights reserved.
//

import UIKit

@IBDesignable
class EXBasicViewOne: UIView {

	// Only override drawRect: if you perform custom drawing.
	override func draw(_ rect: CGRect) {

		//StyleKit Canvas Blue will be drawn with designed size and position
		StyleKit.drawBlueRect()

		//or

		//Calling canvas draw method of StyleKit with defined frame:
		//StyleKit Canvas Blue will be drawn with the size of EXBasicView instance and at default position
		//Circle inside will be resized too. Line width of stroke is intact.

		StyleKit.drawBlueRectFramed(frame: self.bounds)

	}
}
