//
//  TableViewCell.swift
//  petify
//
//  Created by Jose Pol Sastre on 22/9/17.
//  Copyright © 2017 Jose Pol Sastre. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate {
    func didChangeSwitch(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var petImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var petSelected: UISwitch!
    
    var delegate: CustomTableViewCellDelegate!
    
    
    @IBAction func petSelectedAction(_ sender: Any) {
        
        delegate.didChangeSwitch(cell: self)
        
    }
    
}
