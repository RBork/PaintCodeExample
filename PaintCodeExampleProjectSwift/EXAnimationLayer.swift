//
//  EXAnimationLayer.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright © 2015 PixelCut. All rights reserved.
//

import UIKit

class EXAnimationLayer: CALayer {

	@NSManaged var color: CGColor
	@NSManaged var radius: CGFloat
	@NSManaged var width: CGFloat

	override init() {
		super.init()
		color = UIColor.white.cgColor
		radius = 5.0
		width = 5.0
	}

	override init(layer: Any) {
		super.init(layer: layer)

		if let layer = layer as? EXAnimationLayer {
			color = layer.color
			radius = layer.radius
			width = layer.width
		}
	}

	override class func needsDisplay(forKey key: String) -> Bool {
		if key == "color"
			|| key == "radius"
			|| key == "width" {
			return true
		}

		return super.needsDisplay(forKey: key)
	}

	override func action(forKey event: String) -> CAAction? {
		if event == "color"
			|| event == "radius"
			|| event == "width" {
			let animation = CABasicAnimation.init(keyPath: event)
			animation.fromValue = self.presentation()?.value(forKey: event)
			return animation
		}
		return super.action(forKey: event)
	}

	override func draw(in ctx: CGContext) {
		UIGraphicsPushContext(ctx)
			StyleKit.drawLiveButton(liveButtonColor: UIColor.init(cgColor: self.color), radius: self.radius, strokeWidth: self.width)
		UIGraphicsPopContext()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	    fatalError("init(coder:) has not been implemented")
	}
}
