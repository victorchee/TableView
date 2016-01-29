//
//  ViewController.swift
//  TableView
//
//  Created by qihaijun on 11/10/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Normally, a cell’s height is determined by the table view delegate’s tableView:heightForRowAtIndexPath: method. To enable self-sizing table view cells, you must set the table view’s rowHeight property to UITableViewAutomaticDimension. You must also assign a value to the estimatedRowHeight property. As soon as both of these properties are set, the system uses Auto Layout to calculate the row’s actual height.
        tableView.estimatedRowHeight = 44.0
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        
        let enableVibrancy = true
        if enableVibrancy {
            tableView.separatorEffect = vibrancyEffect
        } else {
            tableView.separatorEffect = blurEffect
        }
    }
    
    // MARK: - DataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        cell.label.text = "Cell \(indexPath.row)"
        cell.label.font = cell.label.font.fontWithSize(CGFloat(indexPath.row+1)*4.0)
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.lightGrayColor()
        } else {
            cell.contentView.backgroundColor = UIColor.whiteColor()
        }
        return cell
    }
    
    // MARK: - Delegate
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let destructiveAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Destruct") { (action, indexPath) -> Void in
            print("Destruct \(indexPath)")
        }
        
        let defaultAction = UITableViewRowAction(style: .Default, title: "Default") { (action, indexPath) -> Void in
            print("Default \(indexPath)")
        }
        defaultAction.backgroundColor = UIColor.orangeColor()
        
        let normalAction = UITableViewRowAction(style: .Normal, title: "Normal") { (action, indexPath) -> Void in
            print("Normal \(indexPath)")
        }
        normalAction.backgroundEffect = UIBlurEffect(style: .Dark)
        
        return [destructiveAction, defaultAction, normalAction]
    }
}

