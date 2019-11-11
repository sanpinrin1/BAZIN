//
//  TableViewCell.swift
//  BAZON
//
//  Created by Mohamed Traore on 10/17/19.
//  Copyright © 2019 Mohamed Traore. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var bazinImage: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    
    //STEPPER
    @IBAction func stepAction(_ sender: Any) {
        nombre.text = String(Int(step.value))
    }
    
    @IBOutlet weak var step: UIStepper!
    
    // BUTTON
    @IBOutlet weak var BUY: UIButton!
    
    @IBAction func BuyNow(_ sender: Any) {
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
