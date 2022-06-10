//
//  ViewController.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 08/06/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.indifinder, for: indexPath)
        return cell
    }
    
    private let colectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        colectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.indifinder)
        colectionView.delegate = self
        colectionView.dataSource = self
        view.addSubview(colectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colectionView.frame = view.bounds
    }
    
    func setupView() {
        view.backgroundColor = .green
    }


}

