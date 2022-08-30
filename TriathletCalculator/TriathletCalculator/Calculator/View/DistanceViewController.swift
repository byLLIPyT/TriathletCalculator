//
//  DistanceViewController.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 21.08.2022.
//

import UIKit

class DistanceViewController: UIViewController {
       
    let storageService = StorageService()
    let calculatorViewController = CalculatorViewController()
    
    let titleLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let titleLabel = UILabel()
        titleLabel.text = "Choose type:"
        titleLabel.textColor = textColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let sprintButton: UIButton = {
        let sprintButton = UIButton(type: .system)
        let colorSelectedButton = UIColor(named: "colorSelectedButton")
        let colorInselectedButton = UIColor(named: "colorUnselectedButton")
        
        sprintButton.setTitle("  Sprint", for: .normal)
        let image = UIImage(named: "soccer")?.withRenderingMode(.alwaysOriginal)
        sprintButton.setImage(image, for: .normal)
        sprintButton.layer.borderColor = colorInselectedButton?.cgColor
        sprintButton.setTitleColor(colorSelectedButton, for: .selected)
        sprintButton.setTitleColor(colorInselectedButton, for: .normal)
        sprintButton.layer.borderWidth = 1
        sprintButton.layer.cornerRadius = 16
        sprintButton.translatesAutoresizingMaskIntoConstraints = false
        sprintButton.addTarget(self, action: #selector(sprintDistanceChangeButtonTapped), for: .touchUpInside)
        return sprintButton
    }()
    
    let olympicButton: UIButton = {
        let olympicButton = UIButton(type: .system)
        let colorSelectedButton = UIColor(named: "colorSelectedButton")
        let colorInselectedButton = UIColor(named: "colorUnselectedButton")
        
        olympicButton.setTitle("  Olympic", for: .normal)
        let image = UIImage(named: "olympic")?.withRenderingMode(.alwaysOriginal)
        olympicButton.setImage(image, for: .normal)
        olympicButton.layer.borderColor = colorInselectedButton?.cgColor
        olympicButton.setTitleColor(colorSelectedButton, for: .selected)
        olympicButton.setTitleColor(colorInselectedButton, for: .normal)
        olympicButton.layer.borderWidth = 1
        olympicButton.layer.cornerRadius = 16
        olympicButton.translatesAutoresizingMaskIntoConstraints = false
        olympicButton.addTarget(self, action: #selector(olympicDistanceChangeButtonTapped), for: .touchUpInside)
        return olympicButton
    }()
    
    let ironman703Button: UIButton = {
        
        let colorSelectedButton = UIColor(named: "colorSelectedButton")
        let colorInselectedButton = UIColor(named: "colorUnselectedButton")
        let ironman703Button = UIButton(type: .system)
        ironman703Button.setTitle("  Ironman 70.3", for: .normal)
        let image = UIImage(named: "ironman70")?.withRenderingMode(.alwaysOriginal)
        ironman703Button.setImage(image, for: .normal)
        ironman703Button.layer.borderColor = colorInselectedButton?.cgColor
        ironman703Button.setTitleColor(colorSelectedButton, for: .selected)
        ironman703Button.setTitleColor(colorInselectedButton, for: .normal)
        ironman703Button.layer.borderWidth = 1
        ironman703Button.layer.cornerRadius = 16
        ironman703Button.translatesAutoresizingMaskIntoConstraints = false
        ironman703Button.addTarget(self, action: #selector(ironman703DistanceChangeButtonTapped), for: .touchUpInside)
        return ironman703Button
    }()
    
    let ironman141Button: UIButton = {
        let colorSelectedButton = UIColor(named: "colorSelectedButton")
        let colorInselectedButton = UIColor(named: "colorUnselectedButton")
        let ironman141Button = UIButton(type: .system)
        
        ironman141Button.setTitle("  Ironman", for: .normal)
        let image = UIImage(named: "ironman140")?.withRenderingMode(.alwaysOriginal)
        ironman141Button.setImage(image, for: .normal)
        ironman141Button.layer.borderColor = colorInselectedButton?.cgColor
        ironman141Button.setTitleColor(colorSelectedButton, for: .selected)
        ironman141Button.setTitleColor(colorInselectedButton, for: .normal)
        ironman141Button.layer.borderWidth = 1
        ironman141Button.layer.cornerRadius = 16
        ironman141Button.translatesAutoresizingMaskIntoConstraints = false
        ironman141Button.addTarget(self, action: #selector(ironman140DistanceChangeButtonTapped), for: .touchUpInside)
        return ironman141Button
    }()
    
    let customButton: UIButton = {
        let customButton = UIButton(type: .system)
        let colorButton = UIColor(named: "totalTextColor")
        let textColor = UIColor(named: "colorTextCustomButton")
        customButton.setTitle("Create Custom", for: .normal)
        customButton.layer.borderWidth = 1
        customButton.layer.cornerRadius = 16
        customButton.backgroundColor = colorButton
        customButton.setTitleColor(textColor, for: .normal)
        customButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        return customButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(named: "colorBackgroundPresentationWindow")
        view.backgroundColor = backgroundColor
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        view.addSubview(sprintButton)
        view.addSubview(olympicButton)
        view.addSubview(ironman703Button)
        view.addSubview(ironman141Button)
        
        let firstButtonStack = UIStackView(arrangedSubviews: [sprintButton, olympicButton])
        firstButtonStack.axis = .horizontal
        firstButtonStack.distribution = .fillEqually
        firstButtonStack.spacing = 20
        firstButtonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstButtonStack)
        
        NSLayoutConstraint.activate([
            firstButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            firstButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            firstButtonStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            firstButtonStack.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        let secondButtonStack = UIStackView(arrangedSubviews: [ironman703Button, ironman141Button])
        secondButtonStack.axis = .horizontal
        secondButtonStack.distribution = .fillEqually
        secondButtonStack.spacing = 20
        secondButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondButtonStack)
        
        NSLayoutConstraint.activate([
            secondButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            secondButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            secondButtonStack.topAnchor.constraint(equalTo: firstButtonStack.bottomAnchor, constant: 20),
            secondButtonStack.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        view.addSubview(customButton)
        
        NSLayoutConstraint.activate([
            customButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            customButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            customButton.topAnchor.constraint(equalTo: secondButtonStack.bottomAnchor, constant: 20),
            customButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    @objc func customButtonTapped(sender: UIButton!) {
        let viewControllerToPresent = CreateCustomViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24
        }
        //dismiss(animated: true)
        present(viewControllerToPresent, animated: true, completion: nil)
        
    }
    
    @objc func sprintDistanceChangeButtonTapped(sender: UIButton!) {
        storageService.setSwimDistance(distance: 0.75)
        storageService.setBikeDistance(distance: 20.0)
        storageService.setRunDistance(distance: 5.0)
        
        dismiss(animated: true)
    }
    
    @objc func olympicDistanceChangeButtonTapped(sender: UIButton!) {
        storageService.setSwimDistance(distance: 1.5)
        storageService.setBikeDistance(distance: 40.0)
        storageService.setRunDistance(distance: 10.0)
        
        dismiss(animated: true)
    }
    
    @objc func ironman703DistanceChangeButtonTapped(sender: UIButton!) {
        storageService.setSwimDistance(distance: 1.9)
        storageService.setBikeDistance(distance: 90.0)
        storageService.setRunDistance(distance: 21.0)
        
        dismiss(animated: true)
    }
    
    @objc func ironman140DistanceChangeButtonTapped(sender: UIButton!) {
        storageService.setSwimDistance(distance: 3.8)
        storageService.setBikeDistance(distance: 180.0)
        storageService.setRunDistance(distance: 42.0)
        
        dismiss(animated: true)
    }
}
