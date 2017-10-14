//
//  ColorPickerRouter.swift
//  
//
//  Created by Dominik Kapusta on 14/10/2017.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ColorPickerRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ColorPickerDataPassing
{
    var dataStore: ColorPickerDataStore? { get }
}

class ColorPickerRouter: NSObject, ColorPickerRoutingLogic, ColorPickerDataPassing
{
    weak var viewController: ColorPickerViewController?
    var dataStore: ColorPickerDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: ColorPickerViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: ColorPickerDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
