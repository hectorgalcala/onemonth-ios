//
//  ToDoListViewController.swift
//  TodoApp
//
//  Created by johnq on 2/20/16.
//  Copyright © 2016 johnq. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, AddItemViewControllerProtocol {

    @IBOutlet weak var tableView: UITableView?

    var items = NSMutableArray()
    let cellIdentifier = "CellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.title = "XOGO TODO LIST"
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action:"didTapAdd:")
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier:self.cellIdentifier)
        // self.items.addObject("Hector")
        // self.items.addObject("Juan") // Hard coded data


    }


    override func setEditing(editing: Bool, animated: Bool){
        print("Editting a button")
    }
      // MARK: AddItemViewControllerProtocol

      func addItem(item:String){
        print("addItem() inside TodoViewController")
        // Add the new item to our array of items
        self.items.insertObject(item, atIndex: 0)

        // Modify the tableview/listview to display this new item

        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
      }



      // MARK: - UITableViewDataSource



      func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
      }

      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        print("tableView 2nd f(x)")
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier)!
        print(cell)
        let item = self.items[indexPath.row] as! String
        print("item:")
        print(item)
        cell.textLabel?.text = item
        print(cell)
        return cell
      }


        // MARK: Actions

        func didTapAdd(sender:UIBarButtonItem){
          print("Taping Adding Button in didTapAdd() inside TodoViewController")
          let viewController = AddItemViewController()
          viewController.delegate = self
          let navigationController = UINavigationController(rootViewController: viewController)

          self.presentViewController(navigationController, animated: true, completion: nil)

        }


    /*
    // MARK: - Navigation

\
    */

}
