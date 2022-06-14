//
//  VerticalCell.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 12/06/2022.
//

import UIKit

class VerticalCell: UICollectionViewCell {
    
    static let reuseID = "VerticalCell"
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration:  UIImage.SymbolConfiguration(pointSize: 15, weight: .semibold))?
            .withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerticalCell {
    
    enum Static {
        static let indent: CGFloat = 4
        static let lineIndent: CGFloat = 48
        static let iconSize: CGFloat = 28
    }
    
    func configure() {
        contentView.addSubview(iconView)
        contentView.addSubview(lineSeparators)
        contentView.addSubview(nameLabel)
        contentView.addSubview(button)
        contentView.addSubview(numberPhotosLabel)
        
            iconView.translatesAutoresizingMaskIntoConstraints = false
            lineSeparators.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            button.translatesAutoresizingMaskIntoConstraints = false
            numberPhotosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: Static.iconSize),
            iconView.widthAnchor.constraint(equalToConstant: Static.iconSize),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Static.indent),
            
            lineSeparators.topAnchor.constraint(equalTo: self.bottomAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: 1),
            lineSeparators.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Static.lineIndent),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Static.lineIndent),
            
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Static.iconSize),
            button.widthAnchor.constraint(equalToConstant: Static.iconSize),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -Static.indent),

            numberPhotosLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -1)
        ])
    }
}
