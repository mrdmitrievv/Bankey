//
//  ShakeyBellView.swift
//  Banker
//
//  Created by Артём Дмитриев on 09.02.2023.
//

import UIKit

class ShakeyBellView: UIView {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
}

extension ShakeyBellView {
    
    private func setup() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
        imageView.addGestureRecognizer(singleTap)
        imageView.isUserInteractionEnabled = true
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "bell.fill")!.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = image
    }
    
    private func layout() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func imageViewTapped(_ recogniser: UITapGestureRecognizer) {
        print("Tapped!")
    }
}
