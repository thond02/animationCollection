//
//  CustomCollectionViewCell.swift
//  CustomCollectionView
//
//  Created by Ahmed Abdallah on 10.12.2019.
//  Copyright © 2019 4A5. All rights reserved.
//

import UIKit
let image = UIImage(named: "2.png")!
class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
  
  @IBOutlet weak var titleLBL: UILabel!
    let view = UIImageView(image: image)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.contentMode = .scaleAspectFill
        self.addSubview(view)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = CGRect(origin: .zero, size: self.frame.size)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = .clear
    }
}
