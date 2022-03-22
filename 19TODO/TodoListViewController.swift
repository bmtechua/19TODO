//
//  ViewController.swift
//  19TODO
//
//  Created by bmtech on 24.02.2022.
//

import UIKit

class TodoListController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var myTable: UITableView!
    
    var identifier = "cell"
    var arr: [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arr = UserDefaults.standard.object(forKey: "item") as? [Todo] ?? []
        addButton.layer.cornerRadius = 16

        setSettingNavContr()
        createTable()
    }
    func createTable () {
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.myTable.delegate = self
        self.myTable.dataSource = self
        
        view.addSubview(myTable)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? AddTaskViewController
        vc?.delegate = self
    }
    
    func setSettingNavContr() {
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Let's Do It"
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
        isEditing = !isEditing
    }
    
}
extension TodoListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let temp = arr[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = temp.name
        content.secondaryText = temp.description
        cell.contentConfiguration = content
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            myTable.deleteRows(at: [indexPath], with: .left)
        }
    }
}

extension TodoListController: AddTaskViewControllerDelegate {
    
    func enteredArr(_ name: String, _ disc: String) {
        DispatchQueue.main.async {
            let newEntry = [Todo]()
            UserDefaults.standard.setValue(newEntry, forKey: "items")
            self.arr.append(Todo(name: name, description: disc))
            self.myTable.reloadData()
        }
    }
}
