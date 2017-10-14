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
    func doSomething(request: ColorPicker.Something.Request)
    func updateColor(request: ColorPicker.UpdateColor.Request)
}

protocol ColorPickerDataStore
{
    //var name: String { get set }
}

class ColorPickerInteractor: NSObject, ColorPickerBusinessLogic, ColorPickerDataStore
{
    var presenter: ColorPickerPresentationLogic?
    var worker: ColorPickerWorker = ColorPickerWorker()
    
    // MARK: Do something
    
    func doSomething(request: ColorPicker.Something.Request) {
        worker.doSomeWork()
        
        let response = ColorPicker.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
    func updateColor(request: ColorPicker.UpdateColor.Request) {
        worker.setColor(request.color)
    }
}
