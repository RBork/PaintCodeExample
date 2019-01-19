//
//  EXViewsLayersViewController.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright (c) 2015 PixelCut. All rights reserved.
//

import UIKit

class EXViewsLayersViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var viewWithCustomSubLayer: UIView!
	@IBOutlet weak var viewWithLayerDelegate: EXBasicViewTwo!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		//Setup for UIView with custom sublayer
		let customLayer = EXLayer()
		customLayer.frame = self.viewWithCustomSubLayer.bounds
		customLayer.contentsScale = UIScreen.main.scale
		viewWithCustomSubLayer.layer.addSublayer(customLayer)
		customLayer.setNeedsDisplay()

		//Setup UIView and layer's delegate
		viewWithLayerDelegate.layer.delegate = viewWithLayerDelegate
		viewWithLayerDelegate.layer.contentsScale = UIScreen.main.scale
		viewWithLayerDelegate.layer.setNeedsDisplay()

		//Setup UIImageView image to match size of UIImageView
		self.imageView.image = StyleKit.imageOfBlueRectFramed(imageSize: self.imageView.bounds.size)

	}

}
