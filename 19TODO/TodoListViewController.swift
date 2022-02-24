//
//  ViewController.swift
//  19TODO
//
//  Created by bmtech on 24.02.2022.
//

import UIKit

class TodoListController: UIViewController {

    @IBOutlet weak var addTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskButton.layer.cornerRadius = 16
        
    }


}

