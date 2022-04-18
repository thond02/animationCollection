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
    let bg = UIImageView(image: UIImage(named: "bg_splash.jpg")!)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.addSubview(view)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = CGRect(origin: .zero, size: self.frame.size)
        view.contentMode = .scaleAspectFit
        bg.contentMode = .scaleAspectFit
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = .clear
        self.titleLBL.text = ""
    }
}
