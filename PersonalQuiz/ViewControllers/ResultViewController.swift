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
        animal.reduce(into: [Animal: Int]()) { $0[$1.animal, default: 0] += 1 }
            .max(by: { $0.value < $1.value })?
            .key
    }
    
    private func updateUI() {
        guard let animal = mostFrequentAnimal() else { return }
        
        emojiLabel.text = "Вы \(animal.rawValue.description)"
        describeLabel.text = animal.definition
    }
    
}
