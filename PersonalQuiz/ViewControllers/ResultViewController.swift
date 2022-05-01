//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nasim Nozirov on 21.04.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
   
    private func updateResult() {
        
        var kindOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
 
        for animal in animals {
            if let animalType = kindOfAnimals[animal] {
                kindOfAnimals.updateValue(animalType + 1, forKey: animal)
            } else {
                kindOfAnimals[animal] = 1
            }
        }
        
        let sortedKindOfAnimals = kindOfAnimals.sorted { $0.value > $1.value}
        guard let mostKindOfAnimals = sortedKindOfAnimals.first?.key else { return }
        updateUI(with: mostKindOfAnimals)
    }
   

    private func updateUI(with animal: Animal?) {
        animalLabel.text = "Вы - \(animal?.rawValue ?? "🪱")"
        definitionLabel.text = animal?.definition ?? ""
        
    }
}
