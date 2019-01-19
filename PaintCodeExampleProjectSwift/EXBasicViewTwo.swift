//
//  EXBasicViewTwo.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright © 2015 PixelCut. All rights reserved.
//

import UIKit

class EXBasicViewTwo: UIView {

    override func draw(_ layer: CALayer, in ctx: CGContext) {
        UIGraphicsPushContext(ctx)

        StyleKit.drawBlueRectFramed(frame: layer.bounds)

        UIGraphicsPopContext()
    }

}
