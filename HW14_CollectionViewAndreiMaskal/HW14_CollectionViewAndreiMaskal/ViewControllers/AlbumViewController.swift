//
//  AlbumViewController.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 11/06/2022.
//


import UIKit

class AlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    enum Static {
        static let left: CGFloat = 12
        static let leftIndentLayout: CGFloat = 2
        static let topIndentVerticalSection: CGFloat = 5
    }
    
    enum Sections: Int {
        case first = 0
        case second = 1
        case third = 2
        case fourth = 3
    }
    
    let arrayItems = ItemData.getItem()
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        var addButton = UIBarButtonItem()
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped))
        return addButton
        
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(HorizontalCell.self,
                                forCellWithReuseIdentifier: HorizontalCell.reuseID)
        
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.reuseIdentifier)
        
        collectionView.register(VerticalCell.self,
                                forCellWithReuseIdentifier: VerticalCell.reuseID)
        
        return collectionView
    }()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayItems.count
       }
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrayItems[0].count
        case 1:
            return arrayItems[1].count
        case 2:
            return arrayItems[2].count
        case 3:
            return arrayItems[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = arrayItems[indexPath.section][indexPath.row]
        
        switch (indexPath as NSIndexPath).section {
        case 0...1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HorizontalCell.reuseID,
                for: indexPath) as! HorizontalCell
            
            cell.photoImageView.image = item.image
            cell.namePhotoLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formatted()
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: VerticalCell.reuseID,
                for: indexPath) as! VerticalCell
            
            cell.iconView.image = item.image
            cell.nameLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formatted()
        
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: VerticalCell.reuseID,
                for: indexPath) as! VerticalCell
            
            cell.iconView.image = item.image
            cell.nameLabel.text = item.text
            cell.numberPhotosLabel.text = item.number.formatted()

            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderView.reuseIdentifier,
            for: indexPath) as? HeaderView else {
            return HeaderView()
        }
     
        switch indexPath.section  {
        case 0:
            headerView.label.text = "Мои альбомы"
            headerView.button.text = "Все"
            headerView.button.isHidden = false
        case 1:
            headerView.label.text = "Люди и места"
            headerView.button.text = "Все"
            headerView.button.isHidden = false
        case 2:
            headerView.label.text = "Типы медиафайлов"
            headerView.button.isHidden = true
        case 3:
            headerView.label.text = "Другое"
            headerView.button.isHidden = true
        default:
            break
        }
        return headerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    @objc private func addBarButtonItemTapped() {
        print(#function)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Альбомы"
        navigationItem.leftBarButtonItem = addBarButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

private extension AlbumViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
             layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
            
            switch sectionLayout {
            case .first:
                return self.firstSection()
            case .second:
                return self.secondSection()
            case .third:
                return self.thirdSection()
            case .fourth:
                return self.fourthSection()
            }
        }
        return layout
    }
}

private extension AlbumViewController {
    
    private func firstSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Static.left,
            leading: Static.leftIndentLayout,
            bottom: .zero,
            trailing: Static.leftIndentLayout)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9/2),
            heightDimension: .fractionalWidth(1)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.interItemSpacing = .fixed(90)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .zero
        section.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Static.left,
            bottom: 98,
            trailing: Static.left)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func secondSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: .zero,
                leading: Static.leftIndentLayout,
                bottom: .zero,
                trailing: Static.leftIndentLayout)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.9/2),
                heightDimension: .fractionalWidth(0.9/2)
            )
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
                top: .zero,
                leading: Static.left,
                bottom: 56,
                trailing: Static.left)
            section.orthogonalScrollingBehavior = .paging
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(45))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)

            section.boundarySupplementaryItems = [header]
            
            return section
        }
    
    private func thirdSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/09)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Static.topIndentVerticalSection,
            leading: .zero,
            bottom: .zero,
            trailing: .zero)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize:  itemSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.leading = Static.left
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(45))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
        
        private func fourthSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1/09)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: Static.topIndentVerticalSection,
                leading: .zero,
                bottom: .zero,
                trailing: .zero)
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize:  itemSize,
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets.leading = Static.left
           
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(45))
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            section.boundarySupplementaryItems = [header]
            header.zIndex = Int.max
            
            return section
        }
}

