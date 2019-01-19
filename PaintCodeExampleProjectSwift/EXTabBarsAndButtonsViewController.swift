//
//  EXTabBarsAndButtonsViewController.swift
//  PaintCodeExampleProjectSwift
//
//  Copyright (c) 2015 PixelCut. All rights reserved.
//

import UIKit

class EXTabBarsAndButtonsViewController: UIViewController {

	@IBOutlet weak var tabBar: UITabBar!
	@IBOutlet weak var button: UIButton!
	@IBOutlet weak var bagOne: UIImageView!
	@IBOutlet weak var bagTwo: UIImageView!
	@IBOutlet weak var bagThree: UIImageView!
	
	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
		
		//Customization code for UITabBar
		tabBar.backgroundImage = StyleKit.imageOfTabBarBackground
		tabBar.selectionIndicatorImage = StyleKit.imageOfSelectionIndicator
//        tabBar.shadowImage = StyleKit.imageOfShadowImage
		tabBar.selectedItem = tabBar.items?.first
		
		//Customization code for UIButton
		//Use similar approach for other customizable controls
		button.setBackgroundImage(StyleKit.imageOfButton(selected: false, highlighted: false), for: UIControlState())
		button.setBackgroundImage(StyleKit.imageOfButton(selected: false, highlighted: true), for: UIControlState.highlighted)
		button.setBackgroundImage(StyleKit.imageOfButton(selected: true, highlighted: false), for: UIControlState.selected)
		button.setBackgroundImage(StyleKit.imageOfButton(selected: true, highlighted: true), for: [UIControlState.selected, UIControlState.highlighted])
		
		//Set a image to bag UIImageView and send a custom color as a parameter of StyleKit imageOf... method
		bagOne.image = StyleKit.imageOfBag(bagColor: UIColor.red)
		bagTwo.image = StyleKit.imageOfBag(bagColor: UIColor.green)
		bagThree.image = StyleKit.imageOfBag(bagColor: UIColor.blue)

	}
	
	@IBAction func buttonPressed(_ sender : AnyObject)
	{
		button.isSelected = !button.isSelected;
	}
}
