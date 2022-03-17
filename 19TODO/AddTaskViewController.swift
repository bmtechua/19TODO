//
//  AddTaskViewController.swift
//  19TODO
//
//  Created by bmtech on 24.02.2022.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func enteredTaskName(_ name: String, _ disc: String)
    
}

class AddTaskViewController: UIViewController {
    
    var delegate: AddTaskViewControllerDelegate?
    
        
    

    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var descTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextView.layer.borderWidth = 0.5
        nameTextView.layer.cornerRadius = 5
        nameTextView.layer.masksToBounds = false
        nameTextView.layer.shadowRadius = 2
        nameTextView.layer.shadowOpacity = 1.0
        nameTextView.layer.shadowOffset = CGSize(width: 3, height: 3)
        nameTextView.layer.shadowColor = UIColor.gray.cgColor
        
        descTextView.layer.borderWidth = 0.5
        descTextView.layer.cornerRadius = 5
        descTextView.layer.masksToBounds = false
        descTextView.layer.shadowRadius = 2
        descTextView.layer.shadowOpacity = 1.0
        descTextView.layer.shadowOffset = CGSize(width: 3, height: 3)
        descTextView.layer.shadowColor = UIColor.gray.cgColor

        
        addButton.layer.cornerRadius = 16
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        delegate?.enteredTaskName(nameTextView.text ?? "No name", descTextView.text ?? "No descrription")
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    
}

