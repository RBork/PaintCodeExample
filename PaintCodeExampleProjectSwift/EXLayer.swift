//
//  EXLayer.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright © 2015 PixelCut. All rights reserved.
//

import UIKit

class EXLayer: CALayer {

	override func draw(in ctx: CGContext) {
		
		UIGraphicsPushContext(ctx)
		StyleKit.drawBlueRectFramed(frame: self.frame)
		UIGraphicsPopContext()
	}
	
}
