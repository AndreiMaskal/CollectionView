//
//  PhotosCollectionViewCell.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 09/06/2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    static let indifinder = "PhotosCollectionViewCell"
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images = [
            UIImage(named: "image0"),
            UIImage(named: "image1"),
            UIImage(named: "image2"),
            UIImage(named: "image3"),
            UIImage(named: "image4"),
            UIImage(named: "image5"),
            UIImage(named: "image6"),
            UIImage(named: "image7")
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
