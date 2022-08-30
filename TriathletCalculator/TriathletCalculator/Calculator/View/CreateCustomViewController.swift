//
//  CreateCustomViewController.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 24.08.2022.
//

import UIKit

class CreateCustomViewController: UIViewController {

    let storageService = StorageService()
    
    let titleLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let titleLabel = UILabel()
        titleLabel.text = "Set each duration:"
        titleLabel.textColor = textColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let kilometersButton: UIButton = {
        let kilometersButton = UIButton(type: .system)
        let colorButton = UIColor(named: "colorBackgroundColorButtonKmMl")
        let borderColor = UIColor(named: "colorButtonBorder")
        let textColor = UIColor(named: "colorTextKmMlButton")
        let image = UIImage(named: "flag")?.withRenderingMode(.alwaysOriginal)
        kilometersButton.setTitle("Kilometers", for: .normal)
        kilometersButton.setImage(image, for: .normal)
        kilometersButton.layer.borderWidth = 1
        kilometersButton.layer.cornerRadius = 16
        kilometersButton.layer.borderColor = borderColor?.cgColor
        kilometersButton.backgroundColor = colorButton
        kilometersButton.setTitleColor(textColor, for: .normal)
        //kilometersButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        kilometersButton.translatesAutoresizingMaskIntoConstraints = false
        return kilometersButton
    }()
    
    let milesButton: UIButton = {
        let milesButton = UIButton(type: .system)
        let colorButton = UIColor(named: "colorBackgroundColorButtonKmMl")
        let borderColor = UIColor(named: "colorButtonBorder")
        let textColor = UIColor(named: "colorTextKmMlButton")
        let image = UIImage(named: "flagusa")?.withRenderingMode(.alwaysOriginal)
        milesButton.setTitle("Miles", for: .normal)
        milesButton.setImage(image, for: .normal)
        milesButton.layer.borderWidth = 1
        milesButton.layer.cornerRadius = 16
        milesButton.backgroundColor = colorButton
        milesButton.layer.borderColor = borderColor?.cgColor
        milesButton.setTitleColor(textColor, for: .normal)
        //milesButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        milesButton.translatesAutoresizingMaskIntoConstraints = false
        return milesButton
    }()
    
    let swimImage: UIImageView = {
        let swimImage = UIImageView(image: UIImage(named: "Swim"))
        return swimImage
    }()
    
    let bikeImage: UIImageView = {
        let bikeImage = UIImageView(image: UIImage(named: "Bike"))
        return bikeImage
    }()
    
    let runImage: UIImageView = {
        let runImage = UIImageView(image: UIImage(named: "Run"))
        return runImage
    }()
    
    let swimLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let swimLabel = UILabel()
        swimLabel.text = "Swim"
        swimLabel.textColor = textColor
        swimLabel.translatesAutoresizingMaskIntoConstraints = false
        return swimLabel
    }()
    
    let bikeLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let swimLabel = UILabel()
        swimLabel.text = "Bike"
        swimLabel.textColor = textColor
        swimLabel.translatesAutoresizingMaskIntoConstraints = false
        return swimLabel
    }()
    
    let runLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let swimLabel = UILabel()
        swimLabel.text = "Run"
        swimLabel.textColor = textColor
        swimLabel.translatesAutoresizingMaskIntoConstraints = false
        return swimLabel
    }()
    
    let kmmlswimLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let kmmlswimLabel = UILabel()
        kmmlswimLabel.text = "km"
        kmmlswimLabel.textColor = textColor
        kmmlswimLabel.translatesAutoresizingMaskIntoConstraints = false
        return kmmlswimLabel
    }()
    
    let kmmlbikeLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let kmmlbikeLabel = UILabel()
        kmmlbikeLabel.text = "km"
        kmmlbikeLabel.textColor = textColor
        kmmlbikeLabel.translatesAutoresizingMaskIntoConstraints = false
        return kmmlbikeLabel
    }()
    
    let kmmlrunLabel: UILabel = {
        let textColor = UIColor(named: "textFieldTextColor")
        let kmmlrunLabel = UILabel()
        kmmlrunLabel.text = "km"
        kmmlrunLabel.textColor = textColor
        kmmlrunLabel.translatesAutoresizingMaskIntoConstraints = false
        return kmmlrunLabel
    }()
    
    let swimTextFiled: UITextField = {
       let swimTextFiled = UITextField()
        swimTextFiled.backgroundColor = UIColor(named: "colorTextFiledInCreateCustom")
        swimTextFiled.layer.cornerRadius = 8
        swimTextFiled.placeholder = "   0"
        return swimTextFiled
    }()
    
    let bikeTextFiled: UITextField = {
       let bikeTextFiled = UITextField()
        bikeTextFiled.backgroundColor = UIColor(named: "colorTextFiledInCreateCustom")
        bikeTextFiled.layer.cornerRadius = 8
        bikeTextFiled.placeholder = "   0"
        return bikeTextFiled
    }()
    
    let runTextFiled: UITextField = {
       let runTextFiled = UITextField()
        runTextFiled.backgroundColor = UIColor(named: "colorTextFiledInCreateCustom")
        runTextFiled.layer.cornerRadius = 8
        runTextFiled.placeholder = "   0"
        return runTextFiled
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton(type: .system)
        let colorButton = UIColor(named: "colorBackButton")
        let borderColor = UIColor(named: "colorBackButtonBorder")
        let textColor = UIColor(named: "colorBackButtonText")
        backButton.setTitle("Back", for: .normal)
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 20
        backButton.backgroundColor = colorButton
        backButton.layer.borderColor = borderColor?.cgColor
        backButton.setTitleColor(textColor, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    let createButton: UIButton = {
        let createButton = UIButton(type: .system)
        let colorButton = UIColor(named: "colorCreateButton")
        let textColor = UIColor(named: "colorCreateButtonText")
        createButton.setTitle("Create", for: .normal)
        createButton.layer.borderWidth = 1
        createButton.layer.cornerRadius = 20
        createButton.backgroundColor = colorButton
        createButton.setTitleColor(textColor, for: .normal)
        createButton.addTarget(self, action: #selector(createCustomDistanceButtonTapped), for: .touchUpInside)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        return createButton
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
        
        let firstButtonStack = UIStackView(arrangedSubviews: [kilometersButton, milesButton])
        firstButtonStack.axis = .horizontal
        firstButtonStack.distribution = .fillEqually
        firstButtonStack.spacing = 20
        firstButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(firstButtonStack)
        
        NSLayoutConstraint.activate([
            firstButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            firstButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            firstButtonStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            firstButtonStack.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        let swimButtonStack = UIStackView(arrangedSubviews: [swimImage, swimLabel, swimTextFiled, kmmlswimLabel])
        swimButtonStack.axis = .horizontal
        swimButtonStack.distribution = .fillProportionally
        swimButtonStack.spacing = 20
        swimButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(swimButtonStack)
        
        NSLayoutConstraint.activate([
            swimButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            swimButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            swimButtonStack.topAnchor.constraint(equalTo: firstButtonStack.bottomAnchor, constant: 20),
            swimButtonStack.heightAnchor.constraint(equalToConstant: 34),
            swimImage.heightAnchor.constraint(equalToConstant: 34),
            swimImage.widthAnchor.constraint(equalToConstant: 34),
            kmmlswimLabel.widthAnchor.constraint(equalToConstant: 30),
            swimLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        let bikeButtonStack = UIStackView(arrangedSubviews: [bikeImage, bikeLabel, bikeTextFiled, kmmlbikeLabel])
        bikeButtonStack.axis = .horizontal
        bikeButtonStack.distribution = .fillProportionally
        bikeButtonStack.spacing = 20
        bikeButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bikeButtonStack)
        
        NSLayoutConstraint.activate([
            bikeButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bikeButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            bikeButtonStack.topAnchor.constraint(equalTo: swimButtonStack.bottomAnchor, constant: 20),
            bikeButtonStack.heightAnchor.constraint(equalToConstant: 34),
            bikeImage.heightAnchor.constraint(equalToConstant: 34),
            bikeImage.widthAnchor.constraint(equalToConstant: 34),
            kmmlbikeLabel.widthAnchor.constraint(equalToConstant: 30),
            bikeLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        let runButtonStack = UIStackView(arrangedSubviews: [runImage, runLabel, runTextFiled, kmmlrunLabel])
        runButtonStack.axis = .horizontal
        runButtonStack.distribution = .fillProportionally
        runButtonStack.spacing = 20
        runButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(runButtonStack)
        
        NSLayoutConstraint.activate([
            runButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            runButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            runButtonStack.topAnchor.constraint(equalTo: bikeButtonStack.bottomAnchor, constant: 20),
            runButtonStack.heightAnchor.constraint(equalToConstant: 34),
            runImage.heightAnchor.constraint(equalToConstant: 34),
            runImage.widthAnchor.constraint(equalToConstant: 34),
            kmmlrunLabel.widthAnchor.constraint(equalToConstant: 30),
            runLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        let bottomButtonStack = UIStackView(arrangedSubviews: [backButton, createButton])
        bottomButtonStack.axis = .horizontal
        bottomButtonStack.distribution = .fillProportionally
        bottomButtonStack.spacing = 20
        bottomButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomButtonStack)
        
        NSLayoutConstraint.activate([
            bottomButtonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bottomButtonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            bottomButtonStack.topAnchor.constraint(equalTo: runButtonStack.bottomAnchor, constant: 20),
            bottomButtonStack.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }
    
    @objc func backButtonTapped(sender: UIButton!) {
        dismiss(animated: true)
    }
    
    @objc func createCustomDistanceButtonTapped(sender: UIButton!) {
        if let swimDistance = Double(swimTextFiled.text ?? "0.0"), let bikeDistance = Double(bikeTextFiled.text ?? "0.0"), let runDistance = Double(runTextFiled.text ?? "0.0") {
            storageService.setSwimDistance(distance: swimDistance)
            storageService.setBikeDistance(distance: bikeDistance)
            storageService.setRunDistance(distance: runDistance)
        }
        dismiss(animated: true)
    }
}
