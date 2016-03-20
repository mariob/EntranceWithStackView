//
//  ViewController.swift
//  EntranceWithStackView
//
//  Created by Mario Boikov on 2016-03-18.
//  Copyright © 2016 Mario Boikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        play()
    }

    @IBAction func play() {
        stackView.arrangedSubviews.forEach(stackView.removeArrangedSubview)

        let items = ["Working", "with", "UIStackView", "is", "fun"]

        items
            .map(labelFromText)
            .forEach(addViewToStackView)

        stackView.arrangedSubviews.forEach(applyUnhideAnimationForView)
    }

    private func labelFromText(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        label.textAlignment = .Center
        label.hidden = true
        label.alpha = 0
        label.textColor = .whiteColor()
        return label
    }

    private func addViewToStackView(view: UIView) {
        stackView.addArrangedSubview(view)

        // We don't want the label's width to be animated. Remove to see what happens.
        view.leadingAnchor.constraintEqualToAnchor(stackView.leadingAnchor).active = true
        view.trailingAnchor.constraintEqualToAnchor(stackView.trailingAnchor).active = true
    }

    private func applyUnhideAnimationForView(view: UIView) {
        UIView.animateWithDuration(1, delay: 0,
            usingSpringWithDamping: 0.9, initialSpringVelocity: 1,
            options: [],
            animations: {
                view.alpha = 1
                view.hidden = false
            },
            completion: nil)
    }
}
