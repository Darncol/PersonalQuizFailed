//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var describeLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateUI()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func mostFrequentAnimal() -> Animal? {
        let dogs = answers.filter{ $0.animal == Animal.dog }
        let cats = answers.filter{ $0.animal == Animal.cat }
        let rabbits = answers.filter{ $0.animal == Animal.rabbit }
        let turtles = answers.filter{ $0.animal == Animal.turtle }
        
        return [dogs,cats,rabbits,turtles]
            .max(by: { $0.count < $1.count })?
            .first?
            .animal
    }
    
    private func updateUI() {
        guard let animal = mostFrequentAnimal() else { return }
        
        emojiLabel.text = "Вы \(animal.rawValue.description)"
        describeLabel.text = animal.definition
    }
}
