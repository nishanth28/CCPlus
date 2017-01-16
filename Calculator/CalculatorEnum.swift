//
//  CalculatorEnum.swift
//  Calculator
//
//  Created by Nishanth P on 11/5/16.
//  Copyright © 2016 Nishapp. All rights reserved.
//

import Foundation

enum Operator: String {
    
    case Add = "+"
    case Subtract = "-"
    case Times = "*"
    case Divide = "/"
    case Nothing = ""
    case Modulo = "%"
}

enum CalculationState: String{
    
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
