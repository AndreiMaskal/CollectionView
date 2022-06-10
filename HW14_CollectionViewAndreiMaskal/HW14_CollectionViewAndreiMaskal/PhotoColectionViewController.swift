//
//  PhotoColectionViewController.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 08/06/2022.
//

import UIKit

class PhotoColectionViewController: UICollectionViewController {
    
    //MARK: - Property
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        var addButton = UIBarButtonItem()
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped))
        return addButton
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }
    
    //MARK: - Navigation Item
    
    @objc private func addBarButtonItemTapped() {
        print(#function)
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Альбомы"
        navigationItem.leftBarButtonItem = addBarButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

