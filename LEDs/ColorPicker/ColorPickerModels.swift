//
//  ColorPickerModels.swift
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

enum ColorPicker
{
    // MARK: Use cases
    
    enum Something
    {
        struct Request
        {
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
    
    enum UpdateColor
    {
        struct Request
        {
            let color: UIColor
        }

        struct Response
        {
            let error: Error?
        }

        struct ViewModel
        {
            let errorString: String?
        }
    }
}