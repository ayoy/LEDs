//
//  ColorPickerInteractor.swift
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

protocol ColorPickerBusinessLogic
{
    func fetchCurrentState(request: ColorPicker.CurrentState.Request)
    func updateColor(request: ColorPicker.UpdateColor.Request)
    func updateMotionSensorState(request: ColorPicker.UpdateMotionSensorState.Request)
}

protocol ColorPickerDataStore
{
    var state: ColorPicker.LEDState { get set }
}

class ColorPickerInteractor: NSObject, ColorPickerBusinessLogic, ColorPickerDataStore
{
    var presenter: ColorPickerPresentationLogic?
    var worker: ColorPickerWorker = ColorPickerWorker()
    var state: ColorPicker.LEDState = .uninitialized
    
    // MARK: Do something
    
    func fetchCurrentState(request: ColorPicker.CurrentState.Request) {
        worker.getCurrentState { [weak self] (r, g, b, isMotionEnabled) in
            guard let strongSelf = self else { return }

            let response = ColorPicker.CurrentState.Response(red: r, green: g, blue: b, isMotionSensorEnabled: isMotionEnabled)
            strongSelf.presenter?.computeCurrentState(response: response)
        }
    }
    
    func updateColor(request: ColorPicker.UpdateColor.Request) {
        worker.setColor(request.color)
    }
    
    func updateMotionSensorState(request: ColorPicker.UpdateMotionSensorState.Request) {
        worker.setMotionSensorEnabled(request.isEnabled)
    }
}
