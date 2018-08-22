//
//  ViewController.swift
//  BattleSimulator
//
//  Created by Davi Cabral on 22/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var attackerPokemonImageView: UIImageView!
    @IBOutlet weak var attackerNameLabel: UILabel!
    @IBOutlet weak var attackerHPTextField: UITextField!
    @IBOutlet weak var attackerDPSTextField: UITextField!
    
    @IBOutlet weak var defenderPokemonImageView: UIImageView!
    @IBOutlet weak var defenderNameLabel: UILabel!
    @IBOutlet weak var defenderHPTextField: UITextField!
    @IBOutlet weak var defenderDPSTextField: UITextField!
    
    private var selectedImageView: UIImageView?
    
    private var attackerPokemon: Pokemon? {
        didSet {
            self.attackerPokemonImageView.image = attackerPokemon?.image ?? #imageLiteral(resourceName: "placeholder")
            self.attackerNameLabel.text = attackerPokemon?.name
            self.attackerHPTextField.text = attackerPokemon?.cp == nil ? nil : "\(attackerPokemon?.cp ?? 0)"
            self.attackerHPTextField.isEnabled = true
            self.attackerDPSTextField.text = "\(attackerPokemon?.dps ?? 0)"
            self.attackerDPSTextField.isEnabled = true
        }
    }
    
    private var defenderPokemon: Pokemon? {
        didSet {
            self.defenderPokemonImageView.image = defenderPokemon?.image ?? #imageLiteral(resourceName: "placeholder")
            self.defenderNameLabel.text = defenderPokemon?.name
            self.defenderHPTextField.text = defenderPokemon?.cp == nil ? nil : "\(defenderPokemon?.cp ?? 0)"
            self.defenderHPTextField.isEnabled = true
            self.defenderDPSTextField.text = "\(defenderPokemon?.dps ?? 0)"
            self.defenderDPSTextField.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attackerHPTextField.delegate = self
        attackerDPSTextField.delegate = self
        defenderHPTextField.delegate = self
        defenderDPSTextField.delegate = self
    }

    
    @IBAction func tapSimulationButton(_ sender: UIButton) {
        self.view.endEditing(true)
        
        guard let attacker = attackerPokemon, let defender = defenderPokemon, attacker.cp != nil, defender.cp != nil else {
            print("Falhou o guard let")
            return
        }
        
        let winner = FightLogic.winnerFromBattle(attacker: attacker, defender: defender)
        let alert = UIAlertController(title: "Resultado", message: "\(winner == nil ? "Houve um empate" : "\(winner!.name) venceu")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapPokemonImage(_ sender: UITapGestureRecognizer) {
        self.selectedImageView = sender.view as? UIImageView
        self.performSegue(withIdentifier: "pokemonSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? PokemonViewController {
            controller.selectedSide = selectedImageView == attackerPokemonImageView ? .attacker : .defender
            controller.delegate = self
        }
    }
}

extension ViewController : PokemonDelegate {
    
    func didSelectPokemon(_ pokemon: Pokemon, toSide side: SelectionSide) {
        switch side {
        case .attacker:
            self.attackerPokemon = pokemon
        case .defender:
            self.defenderPokemon = pokemon
        }
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == attackerHPTextField {
            attackerPokemon?.cp = Int(textField.text!)
        } else if textField == defenderHPTextField {
            defenderPokemon?.cp = Int(textField.text!)
        } else if textField == attackerDPSTextField {
            attackerPokemon?.dps = Int(textField.text!) ?? 0
        } else if textField == defenderDPSTextField {
            defenderPokemon?.dps = Int(textField.text!) ?? 0
        }
    }
}

