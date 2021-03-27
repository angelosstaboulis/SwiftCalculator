//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Angelos Staboulis on 26/3/21.
//

import UIKit
import Expression
protocol CalculateProtocol:AnyObject{
    func calculateResult()->Double
    func convertResultToString()->String
}
class ViewController: UIViewController {
    @IBOutlet var buttonNumbers: [UIButton]!
    @IBOutlet var txtReadout: UITextField!
    var result:Double!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClear(_ sender: Any) {
        txtReadout.text = ""
    }
    @IBAction func btnCalculate(_ sender: Any) {
        txtReadout.text = convertResultToString()
    }
    @IBAction func btnNumbers(_ sender: Any) {
        let button = sender as! UIButton
        txtReadout.text = txtReadout.text! + button.currentTitle!
    }
    
}
extension ViewController:CalculateProtocol{
    func calculateResult()->Double{
        do{
            let expression = Expression.init(txtReadout.text!)
            result = try expression.evaluate()
        }
        catch{
            debugPrint("Something went wrong!!!!")
        }
        return result
    }
    func convertResultToString() -> String {
          return String(calculateResult())
    }
}
