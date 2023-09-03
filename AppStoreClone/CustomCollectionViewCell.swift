//
//  CustomCollectionViewCell.swift
//  AppStoreClone
//
//  Created by Kaan Odabaş on 1.09.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // Özel koleksiyon hücrenizin içeriği için gereken özellikleri ve görünümleri ekleyin
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Özel hücre görünümünü burada yapılandırın
        contentView.addSubview(label)
        
        // Özel görünümünüzün yerleşimini burada yapılandırabilirsiniz.
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

