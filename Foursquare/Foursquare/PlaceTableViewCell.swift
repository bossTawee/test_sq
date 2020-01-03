//
//  PlaceTableViewCell.swift
//  Foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 3/1/2563 BE.
//  Copyright © 2563 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    var arr = [String]()
    
    @IBOutlet weak var imageCell: UIImageView!{
        didSet {
            imageCell.layer.cornerRadius = 44
        }
    }
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var detailCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(item: venueData ) {
        arr = item.location.formattedAddress
        let location = arr.joined(separator: " ")
        //AccessDeniedAccess
//        let imgUrl = "\(item.categories[0].icon.prefix)\(item.categories[0].icon.suffix)"
//        guard let url =  URL(string: imgUrl) else {return}
        nameCell.text = item.name
        detailCell.text = location
        imageCell.image = UIImage(named: "pin")
        
    }
}
