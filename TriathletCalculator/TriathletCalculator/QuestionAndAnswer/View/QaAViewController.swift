//
//  QaAViewController.swift
//  TriathletCalculator
//
//  Created by Александр Уткин on 29.04.2022.
//

import UIKit

class QaAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var paywallView: UIView!
    @IBOutlet weak var verticalView: UIView!
    @IBOutlet weak var headerPaywallLabel: UILabel!
    @IBOutlet weak var paywallText: UILabel!
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "qaCell", for: indexPath) as? quTableViewCell {
            cell.setupUI()
            return cell
        }
        return tableView.dequeueReusableCell(withIdentifier: "qaCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerToPresent = QuestionViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(named: "backgroundColor")
        view.backgroundColor = backgroundColor
        setupUI()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.paywallView.addGestureRecognizer(gesture)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        let viewControllerToPresent = PaywallViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    private func setupUI() {
        let questionViewColor = UIColor(named: "questionView")
        let verticalViewColor = UIColor(named: "verticalViewColor")
        let headerPaywallTextColor = UIColor(named: "colorPaywallHeaderTextColor")
        let paywallTextColor = UIColor(named: "colorPaywallTextColor")
        
        paywallView.layer.cornerRadius = 12
        paywallView.backgroundColor = questionViewColor
        verticalView.backgroundColor = verticalViewColor
        headerPaywallLabel.textColor = headerPaywallTextColor
        paywallText.textColor = paywallTextColor
    }
    
    
}
