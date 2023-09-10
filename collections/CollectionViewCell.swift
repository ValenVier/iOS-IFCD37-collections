//
//  CollectionViewCell.swift
//  collections
//
//  Created by Javier Rodríguez Valentín on 27/09/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        label.textColor = .blue
        label.backgroundColor = .yellow
        
        
    }

}
