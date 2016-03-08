 //
 //  AddItemViewController.swift
 //  TodoApp
 //
 //  Created by johnq on 3/6/16.
 //  Copyright © 2016 johnq. All rights reserved.
 //

 import UIKit

protocol AddItemViewControllerProtocol {

  func addItem(item: String)

 }

 class AddItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField?
    var delegate: AddItemViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
                 self.title = "Add Item"
                 self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action:"didTapCancel:")
                 self.view.backgroundColor = UIColor.blueColor()
                 self.edgesForExtendedLayout = UIRectEdge.None

        // Do any additional setup after loading the view.
                 self.textField?.becomeFirstResponder()
                 self.textField?.delegate = self
    }
        // MARK: Actions
             func didTapCancel(sender: UIBarButtonItem){
               self.dismissViewControllerAnimated(true, completion: nil)
             }
        // MARK: UITextFieldDelegate
             func textFieldShouldReturn(textField: UITextField)-> Bool{
                print("textFieldShouldReturn() ->")
                if let delegate = self.delegate, let item = textField.text where textField.text?.characters.count > 0 {
                  print("textfield return protocol start")
                  delegate.addItem(item)
                  print("delegate return protocol end")
                }
                self.dismissViewControllerAnimated(true, completion:nil)
                return true
    }

 }
