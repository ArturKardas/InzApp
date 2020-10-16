//
//  ViewController.swift
//  ProjektAplikacjiPojazd
//
//  Created by Artur Kardas  on 25/05/2020.
//  Copyright © 2020 Artur Kardas . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var valueActual = 0
    var stanLed = 1
    @IBOutlet weak var buttonLED: UIButton!
    @IBOutlet weak var buttonSTOP: UIButton!
    @IBOutlet weak var sliderDirection: UISlider!
    
    @IBOutlet weak var textMIN: UITextField!
    @IBOutlet weak var textMAX: UITextField!
    
    @IBOutlet weak var textInfo: UITextField!
    
    @IBOutlet weak var stepperMIN: UIStepper!
    @IBOutlet weak var stepperMAX: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textMIN.text = String(stepperMIN.value)
        textMAX.text = String(stepperMAX.value)
    }

    @IBAction func clkickLED(_ sender: Any) {
        
        let url = URL(string: "http://192.168.4.1/led?led=" + String(stanLed))!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
                self.textInfo.text = "error: \(error)"
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    self.textInfo.text = "data: \(dataString)"
                }
            }
        }
        
        if stanLed == 0 {
            stanLed = 1
            buttonLED.setTitle( "LED ON", for: .normal)
        } else {
            stanLed = 0
            buttonLED.setTitle( "LED OFF", for: .normal)
        }
        
        task.resume()
    }
    
    @IBAction func buttonGoRealesed(_ sender: Any) {
        
        let url = URL(string: "http://192.168.4.1/motor?motor=0")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
                self.textInfo.text = "error: \(error)"
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    self.textInfo.text = "data: \(dataString)"
                }
            }
        }
        
        task.resume()
        
    }

    
    @IBAction func buttonGoPress(_ sender: Any) {
        let url = URL(string: "http://192.168.4.1/motor?motor=1")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
                self.textInfo.text = "error: \(error)"
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    self.textInfo.text = "data: \(dataString)"
                }
            }
        }
        
        task.resume()
    }
    
    @IBAction func buttonStopPress(_ sender: Any) {
        
        let url = URL(string: "http://192.168.4.1/motor?motor=-1")!
               
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                           print("error: \(error)")
                           self.textInfo.text = "error: \(error)"
            } else {
                if let response = response as? HTTPURLResponse {
                               print("statusCode: \(response.statusCode)")
                    }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                               print("data: \(dataString)")
                               self.textInfo.text = "data: \(dataString)"
                    }
                }
            }
        task.resume()
    }
    
    @IBAction func buttonStopCaceled(_ sender: Any) {
        let url = URL(string: "http://192.168.4.1/motor?motor=0")!
               
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                           print("error: \(error)")
                           self.textInfo.text = "error: \(error)"
            } else {
                if let response = response as? HTTPURLResponse {
                               print("statusCode: \(response.statusCode)")
                    }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                               print("data: \(dataString)")
                               self.textInfo.text = "data: \(dataString)"
                    }
                }
            }
        task.resume()
    }
    
    
    @IBAction func changeDirectory(_ sender: UISlider) {
        
        let value = sender.value
        
        if ((Int(value) % 2 ) == 0) && (valueActual != Int(value)){
            let url = URL(string: "http://192.168.4.1/servo?servo=" + String(Int(value)))!
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                    self.textInfo.text = "error: \(error)"
                } else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print("data: \(dataString)")
                        self.textInfo.text = "data: \(dataString)"
                    }
                }
            }
            
            task.resume()
        }
        valueActual = Int(value);
    }
    
    @IBAction func changeMinValue(_ sender: Any) {
        textMIN.text = String(stepperMIN.value)
        
        sliderDirection.minimumValue = Float(stepperMIN.value)
    }
    
    @IBAction func changeMaxValue(_ sender: Any) {
        textMAX.text = String(stepperMAX.value)
            
        sliderDirection.maximumValue = Float(stepperMAX.value)
    }
}



