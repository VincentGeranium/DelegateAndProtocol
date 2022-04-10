//
//  PokemonController.swift
//  protocolDelegate
//
//  Created by Kwangjun Kim on 2022/04/10.
//

import Foundation
import UIKit

protocol PokemonControllerDelegate {
    func didChoicePokemon(pokemonImage: UIImage, name: String)
}

class PokemonController: UIViewController {
    var delegate: PokemonControllerDelegate?
    
    let charmanderButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "Charmander"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapCharmanderButton), for: .touchUpInside)
        
        return button
    }()
    
    let squirtleButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "Squirtle"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapSquirtleButton), for: .touchUpInside)
        
        return button
    }()
    
    let bulbasaurButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "Bulbasaur"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapBulbasaurButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        super.viewDidLoad()
        setupCharmanderButton()
        setupSquirtleButton()
        setupBulbasaurButton()
    }
}


extension PokemonController {
    func setupCharmanderButton() {
        charmanderButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(charmanderButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let height = (UIScreen.main.bounds.height / 3) - 40
        
        NSLayoutConstraint.activate([
            charmanderButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            charmanderButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            charmanderButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            charmanderButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            charmanderButton.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setupSquirtleButton() {
        squirtleButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(squirtleButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let height = (UIScreen.main.bounds.height / 3) - 40
        
        NSLayoutConstraint.activate([
            squirtleButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            squirtleButton.topAnchor.constraint(equalTo: charmanderButton.bottomAnchor, constant: 10),
            squirtleButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            squirtleButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            squirtleButton.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func setupBulbasaurButton() {
        bulbasaurButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(bulbasaurButton)
        
        let guide = self.view.safeAreaLayoutGuide
        
        let height = (UIScreen.main.bounds.height / 3) - 40
        
        NSLayoutConstraint.activate([
            bulbasaurButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            bulbasaurButton.topAnchor.constraint(equalTo: squirtleButton.bottomAnchor, constant: 10),
            bulbasaurButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            bulbasaurButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            bulbasaurButton.heightAnchor.constraint(equalToConstant: height)
        ])
    }

}

extension PokemonController {
    @objc func didTapCharmanderButton() {
        guard let image = UIImage(named: "Charmander") else { return }
        delegate?.didChoicePokemon(pokemonImage: image, name: "Charmander")
        dismiss(animated: true)
    }
    
    @objc func didTapSquirtleButton() {
        guard let image = UIImage(named: "Squirtle") else { return }
        delegate?.didChoicePokemon(pokemonImage: image, name: "Squirtle")
        dismiss(animated: true)
    }
    
    @objc func didTapBulbasaurButton() {
        guard let image = UIImage(named: "Bulbasaur") else { return }
        delegate?.didChoicePokemon(pokemonImage: image, name: "Bulbasaur")
        dismiss(animated: true)
    }
}
