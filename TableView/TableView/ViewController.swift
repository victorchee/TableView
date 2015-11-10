//
//  ViewController.swift
//  TableView
//
//  Created by qihaijun on 11/10/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
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

