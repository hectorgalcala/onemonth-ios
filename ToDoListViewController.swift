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
    let cacheKey = "cacheKey"
    var cache: CacheProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.title = "XOGO TODO LIST"
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action:"didTapAdd:")
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier:self.cellIdentifier)
        // self.items.addObject("Hector")
        // self.items.addObject("Juan") // Hard coded data


    }

      // MARK: AddItemViewControllerProtocol

      func addItem(item:String){
        print("addItem() inside TodoViewController item:")
        print(item)
        // Add the new item to our array of items
        self.items.insertObject(item, atIndex: 0)

        // Modify the tableview/listview to display this new item
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
      }



      // MARK: - UITableViewDataSource

      func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("first TableView")
        print("self.items.count")
        print(self.items.count)
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

      func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
          self.items.removeObjectAtIndex(indexPath.row)
          self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
          // save the editing
          self.save()
        }
      }


        // MARK: Actions

        func didTapAdd(sender:UIBarButtonItem){
          print("Taping Adding Button in didTapAdd() inside TodoViewController")
          let viewController = AddItemViewController()
          viewController.delegate = self
          let navigationController = UINavigationController(rootViewController: viewController)

          self.presentViewController(navigationController, animated: true, completion: nil)

        }

        override func setEditing(editing: Bool, animated: Bool){
            print("Editting a button")
            super.setEditing(editing, animated: animated)
           self.tableView?.setEditing(editing, animated: animated)
           self.navigationItem.rightBarButtonItem?.enabled = !editing
        }


        // MARK: Data Manipulation Cache Actions
        func load(){
          print("Hello TodoList.load() World")
          let object = self.cache?.loadObjectForKey(cacheKey)
          if let items = object as? NSArray{
            self.items = NSMutableArray(array: items)
          }
        }

        func save(){
          print("Hello TodoList.save() World")
          self.cache?.saveObject(self.items, key: cacheKey)
        }

}
