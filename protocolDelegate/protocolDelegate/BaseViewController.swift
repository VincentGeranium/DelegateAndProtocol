//
//  BaseViewController.swift
//  protocolDelegate
//
//  Created by Kwangjun Kim on 2022/04/10.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    let pokemonVC = PokemonController()
    
    var imageView: UIImageView = {
        var imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "Dr")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        var nameLabel: UILabel = UILabel()
        nameLabel.text = ""
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.layer.cornerRadius = 10
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = UIColor.label.cgColor
        nameLabel.isHidden = true
        
        return nameLabel
    }()
    
    var button: UIButton = {
        var button: UIButton = UIButton()
        button.setTitle("choose pockemon", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.isHidden = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        pokemonVC.delegate = self
        
        setupImageView()
        setupNameLabel()
        setupButton()
    }
}

extension BaseViewController {
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func didTapButton() {
//        let pokemonVC = PokemonController()
        pokemonVC.modalPresentationStyle = .fullScreen
        present(pokemonVC, animated: true)
    }
    
    func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(nameLabel)
        
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension BaseViewController: PokemonControllerDelegate {
    func didChoicePokemon(pokemonImage: UIImage, name: String) {
        imageView.image = pokemonImage
        DispatchQueue.main.async { [weak self] in
            self?.nameLabel.isHidden = false
            self?.nameLabel.text = name
        }
       
    }
    
    
}
