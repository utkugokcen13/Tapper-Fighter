//
//  ViewController.swift
//  TapperFighter
//
//  Created by Tuba N. Yıldız on 13.11.2022.
//

import UIKit




class ViewController: UIViewController {

    var seconds = 15
    var timer = Timer()
    var isTimerRunning = false
    var userArr: [User] = []
    var tapCount = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTappedStartButton(_ sender: Any) {
        
        if !isTimerRunning {
            
            let alertController = UIAlertController(title: "Add New Name", message: "", preferredStyle: UIAlertController.Style.alert)
           
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                    let firstTextField = alertController.textFields![0] as UITextField
                
                
                self.userArr.append(User(name: firstTextField.text ?? ""))
                
                Globals.UserDefaults.user = self.userArr
                self.runTimer()
                self.isTimerRunning = true
                self.startButton.setTitle("\(self.tapCount)", for: .normal)

            
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                    (action : UIAlertAction!) -> Void in })
            alertController.addTextField { (textField : UITextField!) -> Void in
                    textField.placeholder = "Enter First Name"
                }
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else{
            tapCount += 1
            self.startButton.setTitle("\(self.tapCount)", for: .normal)

        }
        
    }
    
    
    func runTimer() {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        }
         
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = "Time Left: \(seconds)"
        }
        else {
            startButton.isEnabled = false
            timer.invalidate()
            print(Globals.UserDefaults.user)
        }
        
    }

}

