//
//  ViewController.swift
//  SimpleBadge
//
//  Created by teakun on 2019/09/24.
//  Copyright © 2019 kittengine.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let badgeLabel = BadgeLabel(frame: CGRect())
        view.addSubview(badgeLabel)
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        badgeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        badgeLabel.insets = CGSize(width: 4, height: 4)
        
        badgeLabel.text = "5"
        badgeLabel.font = UIFont.boldSystemFont(ofSize: 13)
    }
}

