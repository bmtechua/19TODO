//
//  AddTaskViewController.swift
//  19TODO
//
//  Created by bmtech on 24.02.2022.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func enteredArr(_ name: String, _ description: String)
}

class AddTaskViewController: UIViewController {
    
    var delegate: AddTaskViewControllerDelegate?

    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.masksToBounds = false
        nameTextField.layer.shadowRadius = 2
        nameTextField.layer.shadowOpacity = 1.0
        nameTextField.layer.shadowOffset = CGSize(width: 3, height: 3)
        nameTextField.layer.shadowColor = UIColor.gray.cgColor
        
        descTextField.layer.borderWidth = 0.5
        descTextField.layer.cornerRadius = 5
        descTextField.layer.masksToBounds = false
        descTextField.layer.shadowRadius = 2
        descTextField.layer.shadowOpacity = 1.0
        descTextField.layer.shadowOffset = CGSize(width: 3, height: 3)
        descTextField.layer.shadowColor = UIColor.gray.cgColor

        
        addButton.layer.cornerRadius = 16
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        
        if nameTextField.text == ""  {
            let alertController = UIAlertController(title: "Error", message: "Please enter name!", preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertOkAction)
        
        present(alertController, animated: true)
        } else if descTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter description!", preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertOkAction)
        
        present(alertController, animated: true)
        } else {
        delegate?.enteredArr(nameTextField.text ?? "nil", descTextField.text ?? "nil")
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        }
    }
    
    
}

