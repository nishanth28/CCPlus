//
//  ViewController.swift
//  Calculator
//
//  Created by Nishanth P on 9/18/16.
//  Copyright © 2016 Nishapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.Nothing
    var calcState: CalculationState = CalculationState.enteringNum
    
    var startValue: String = ""

    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func removeLastDigit(_ sender: UIButton) {
        
        let name: String = self.resultLabel.text!
        let stringLength = name.characters.count
        if stringLength != 0{
            
        let substringIndex = stringLength - 1
            resultLabel.text = (name as NSString).substring(to: substringIndex)}
    }
    
    @IBAction func numberTouch(_ sender: UIButton)
    {
        updateLabel(number: String(sender.tag))
    }
    
    func updateLabel(number:String)
    {
        if calcState == CalculationState.newNumStarted{
            if let num = resultLabel.text{
                if num != "" {
                    startValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
        }
        
    }
    @IBAction func Pi(_ sender:UIButton)
    {
        
        resultLabel.text = resultLabel.text! + "3.14"
        
    }
    
    @IBAction func DecimalPoint(_ sender:UIButton)
    {
        let string = resultLabel.text
        if string?.range(of:".") != nil{
            return
        }else{
        resultLabel.text = resultLabel.text! + "."}
    }
    
    @IBAction func AllClear(_ sender:UIButton)
    {
        resultLabel.text = ""
    }
    
    func highlight(tag: Int){
        
        for i in 10..<17{
            
            if let button = self.view.viewWithTag(i) as? UIButton{
                
                button.layer.borderWidth = 0
                
            }
            if let button = self.view.viewWithTag(tag) as? UIButton{
                
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.black.cgColor
                
                
            }
            
            
        }
        
       
    }
    
   
    
    @IBAction func OperatorTouch(_ sender: UIButton)
    {
       
        calcState = CalculationState.newNumStarted
        if let num = resultLabel.text {
            if num != "" {
                startValue = num
                resultLabel.text = ""
            }
        }
        highlight(tag: sender.tag)
        switch sender.tag{
        case 10:
            
            print("Add")
            currentOperation = Operator.Add
        case 11:
            
            print("Sub")
            currentOperation = Operator.Subtract
        case 12:
            
            print("Mul")
            currentOperation = Operator.Times
        case 13:
            
            print("Divide")
            currentOperation = Operator.Divide
        case 19:
            
            print("Modulo")
            currentOperation = Operator.Modulo
        default:
            return
        
        }
        
    }
    
    @IBAction func equalsButton(_ sender:UIButton)
    {
        highlight(tag: sender.tag)
        calculate()
    }
    
    func calculate(){
        
        if(startValue.isEmpty){
            return
        }
        if(resultLabel.text?.isEmpty)!
        {
            return
        }
        if(resultLabel.text == ".")
        {
            return
        }
        var result = ""
        
        if currentOperation == Operator.Times {
            result = "\(Double(startValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Divide {
            result = "\(Double(startValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Add {
            result = "\(Double(startValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Subtract {
            result = "\(Double(startValue)! - Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Modulo {
            result = "\(Int(startValue)! % Int(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

