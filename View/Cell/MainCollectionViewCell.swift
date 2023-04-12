//
//  MainCollectionViewCell.swift
//  1stGameFindAPair
//
//  Created by Nikita Nemtsu on 12.04.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let idMainCollectionViewCell = "idMainCollectionViewCell"
    
    let imageLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellFaceUp = false {
        didSet {
            if self.cellFaceUp {
                backgroundColor = .black
            } else {
                backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                imageLabel.text = ""
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        layer.cornerRadius = 5
        
        addSubview(imageLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
