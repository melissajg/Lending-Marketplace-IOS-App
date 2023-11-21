//
//  ItemCell.swift
//  LendShark
//
//  Created by Melissa Gaines on 11/21/23.
//

import Foundation
import UIKit

// A cell to display a task
class ItemCell: UITableViewCell {
    


    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemEmojisLabel: UILabel!
    @IBOutlet weak var tradeTypeLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
}
