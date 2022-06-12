//
//  HorizontalCell.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 12/06/2022.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    static let reuseID = "HorizontalCell"
    
    enum Static {
        static let indent: CGFloat = 4
        static let photoRadius: CGFloat = 10
    }
        
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Static.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension HorizontalCell {
    
    func configure() {
    
        addSubview(photoImageView)
        addSubview(namePhotoLabel)
        addSubview(numberPhotosLabel)
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        namePhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        numberPhotosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Static.indent),
            
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: Static.indent),
        ])
    }
}
