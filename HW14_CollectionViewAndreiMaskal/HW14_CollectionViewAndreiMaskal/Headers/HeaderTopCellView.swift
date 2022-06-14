//
//  HeaderTopCellView.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 11/06/2022.
//

import UIKit

class HeaderTopCellView: UICollectionReusableView {
  static let reuseIdentifier = "header"
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        return line
    }()
    
    lazy var label: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 22, weight: .semibold)
        lable.textColor = .black
        return lable
    }()
    
    lazy var button: UILabel = {
        let button = UILabel()
        button.textAlignment = .right
        button.font = .systemFont(ofSize: 18, weight: .regular)
        button.textColor = .systemBlue
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.isHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
}

extension HeaderTopCellView {
    
    func configure() {
        
        addSubview(label)
        addSubview(lineSeparators)
        addSubview(button)
    
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        lineSeparators.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.topAnchor.constraint(equalTo:  label.topAnchor),
            button.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lineSeparators.bottomAnchor.constraint(equalTo: label.topAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: 1),
            lineSeparators.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
     }
}

