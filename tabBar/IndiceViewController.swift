//
//  IndiceViewController.swift
//  tabBar
//
//  Created by Sea Ray on 9/9/2567 BE.
//



import UIKit

class IndiceViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var items: [IndexItem] = []
    let dataLoader = DataLoader()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load data
        if let loadedItems = dataLoader.loadItems() {
            items = loadedItems
        }

        // set collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .lightGray
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let item = items[indexPath.item]
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: 5, width: cell.bounds.width - 20, height: 20))
        nameLabel.text = item.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        let valueLabel = UILabel(frame: CGRect(x: 10, y: 30, width: cell.bounds.width - 20, height: 20))
        valueLabel.text = "Value: \(item.value)"
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        
        let changeLabel = UILabel(frame: CGRect(x: 10, y: 55, width: cell.bounds.width - 20, height: 20))
        changeLabel.text = "Change: \(item.change)"
        changeLabel.font = UIFont.systemFont(ofSize: 14)
        
        let percentChangeLabel = UILabel(frame: CGRect(x: 10, y: 80, width: cell.bounds.width - 20, height: 20))
        percentChangeLabel.text = "Percent Change: \(item.percentChange)"
        percentChangeLabel.font = UIFont.systemFont(ofSize: 14)
        
        cell.contentView.addSubview(nameLabel)
        cell.contentView.addSubview(valueLabel)
        cell.contentView.addSubview(changeLabel)
        cell.contentView.addSubview(percentChangeLabel)
        
        return cell
    }

    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 20) / 2
        return CGSize(width: width, height: 150)
    }
}
