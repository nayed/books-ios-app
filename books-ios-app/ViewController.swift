//
//  ViewController.swift
//  books-ios-app
//
//  Created by stagiaire on 03/05/2016.
//  Copyright © 2016 Nayed. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddBookDelegate {
    
    var manageObjectContext: NSManagedObjectContext!
    var myBook: Book = Book()
    @IBOutlet weak var addBook: UIBarButtonItem!
    @IBOutlet weak var myTable: UITableView!
    
    
    func verifyUserInput(controller: AddBookViewController, title: String, price: Double, year: Int) {
        if manageObjectContext != nil {
            let entity = NSEntityDescription.entityForName("Book", inManagedObjectContext: manageObjectContext!)
            let book = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageObjectContext!) as! Book
            book.title = title
            book.price = price
            book.year = year
            
            do {
                try manageObjectContext.save()
            } catch let error as NSError {
                NSLog("Error: %@", error)
            }
        }
        myTable.reloadData()
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        manageObjectContext = appDelegate.managedObjectContext as NSManagedObjectContext
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadBooks().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        let book = loadBooks()[indexPath.row] as! Book
        cell?.textLabel!.text = book.title
        cell?.detailTextLabel!.text = String(book.price!) + " €"
        return cell!
    }
    
    func loadBooks() -> [AnyObject] {
        let fetchRequest = NSFetchRequest(entityName: "Book")
        var result = [AnyObject]()
        
        do {
            result = try manageObjectContext.executeFetchRequest(fetchRequest)
        } catch let error as NSError {
            NSLog("Error: %@", error)
        }
        return result
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            manageObjectContext.deleteObject(loadBooks()[indexPath.row] as! Book)
            
            do {
                try manageObjectContext.save()
            } catch let error as NSError {
                NSLog("Error: %@", error)
            }

            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddBookSegue" {
            let viewController = segue.destinationViewController as! AddBookViewController
            //viewController.previousNumber = previousNumber
            viewController.delegate = self
        }
    }

}

