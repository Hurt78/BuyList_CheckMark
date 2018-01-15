//
//  FirstViewController.swift
//  BuyList
//
//  Created by i on 11.12.2017.
//  Copyright © 2017 i.niko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var itemTextField: UITextField!
  
  @IBOutlet weak var label: UILabel!
  
  @IBAction func add(_ sender: Any) {
    
    // проверка ввода пустого текста
    
    if itemTextField.text?.isEmpty ?? true {
      return label.text = "Поле ввода не должно быть пустым"
    }else {
      label.text = ""
    }
    
    let itemsObject = UserDefaults.standard.object(forKey: "items")
    
    var items:[String]
    
    if  let tempItems = itemsObject as? [String] {
      
      items = tempItems
      
      items.append(itemTextField.text!)
      
    } else {
      
      items = [itemTextField.text!]
    }
    
    UserDefaults.standard.set(items, forKey: "items")
    
    itemTextField.text = ""
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    self.view.endEditing(true)
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    return true
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

