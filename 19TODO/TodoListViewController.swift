//
//  ViewController.swift
//  19TODO
//
//  Created by bmtech on 24.02.2022.
//

import UIKit

class TodoListController: UIViewController{
    @IBOutlet  var myTable: UITableView!
    
    
    //@IBOutlet weak var inputLabel: UILabel!
    var identifier = "myCell"
    var arr: [(String, String)] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        createTable()
        
   
    
    }
    
    func createTable() {
        
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.myTable.delegate = self
        self.myTable.dataSource = self
        
        
        view.addSubview(myTable)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddTaskViewController else {
            return
        }
        vc.delegate = self
    }
   
}

extension TodoListController: AddTaskViewControllerDelegate {
    func enteredTaskName(_ name: String, _ disc: String) {
        //inputLabel.text = name + " - " + disc
        let temp = (name, disc)
        arr.append(temp)
        print(arr)
    }
}

extension TodoListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let temp = arr[indexPath.row]
        cell.textLabel?.text = "Test" + temp.0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
