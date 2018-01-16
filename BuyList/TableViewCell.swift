//
//  TableViewCell.swift
//  BuyList
//
//  Created by i on 16.01.2018.
//  Copyright © 2018 i.niko. All rights reserved.
//

import UIKit
class TableViewCell: UITableViewCell
{

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
//    Использование автоматической компоновки в UITableView
//    для динамических раскладок ячеек и переменных высот строк
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }

}
