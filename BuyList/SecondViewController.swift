//
//  SecondViewController.swift
//  BuyList
//
//  Created by i on 11.12.2017.
//  Copyright © 2017 i.niko. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController, UITextViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var table: UITableView!
    var items:[String] = []

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //        let cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.label?.text = items[indexPath.row]
        return cell
    }


    // Убрать добавить checkmark в ячейки таблицы
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }

        //        if let cell = tableView.cellForRow(at: indexPath)
        //        {
        //            if cell.accessoryType == .none
        //            {cell.accessoryType = .checkmark
        //            }else {
        //                cell.accessoryType = .none
        //            }
        //        }

    }


    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if  let tempItems = itemsObject as? [String]
        {
            items = tempItems
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    
    override func didReceiveMemoryWarning() 
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

