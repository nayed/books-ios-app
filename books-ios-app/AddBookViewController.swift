//
//  AddBookViewController.swift
//  books-ios-app
//
//  Created by stagiaire on 04/05/2016.
//  Copyright © 2016 Nayed. All rights reserved.
//

import UIKit

protocol AddBookDelegate {
    func verifyUserInput(controller: AddBookViewController, title: String, price: Double, year: Int)
}

class AddBookViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: AddBookDelegate? = nil
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var validateBtn: UIButton!
    
    @IBAction func tapAction(sender: AnyObject) {
        titleTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        yearTextField.resignFirstResponder()
    }
    
    @IBAction func validateBtnAction(sender: AnyObject) {
        if delegate != nil {
            delegate?.verifyUserInput(self, title: titleTextField.text!, price: Double(priceTextField.text!)!, year: Int(yearTextField.text!)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
