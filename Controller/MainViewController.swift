//
//  MainViewController.swift
//  1stGameFindAPair
//
//  Created by Nikita Nemtsu on 12.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var collectionView = MainCollectionView(count: 20)
    
    private let imagesArray = ["🦊", "🐯", "🐸", "🦁", "🦆", "🐷", "🦉", "🐴", "🦖", "🐍"]
    
    private lazy var gameModel = GameModel(numberPairCard: collectionView.numberOfItems(inSection: 0) / 2)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9205397964, green: 0.8242565989, blue: 0.5926644206, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.cellDelegate = self
    }
}
//MARK: - MainCollectionViewProtocol
extension MainViewController: MainCollectionViewProtocol {
    func selectItem(indexPath: IndexPath) {
        
        gameModel.selectCard(index: indexPath.item)
        
        for (index, card) in gameModel.cards.enumerated() {
            let cell = collectionView.cellForItem(at: [0, index]) as? MainCollectionViewCell
            cell?.isHidden = card.isMatched
            cell?.cellFaceUp = card.isFaceUp
            cell?.imageLabel.text = card.isFaceUp ? imagesArray[card.identifier] : ""
        }
    }
}
//MARK: - setConstraints
extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
