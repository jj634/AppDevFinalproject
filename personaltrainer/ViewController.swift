//
//  ViewController.swift
//  personaltrainer
//
//  Created by Jason Jung on 4/26/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SaveButtonDelegate1 {

    

    
    var routinename: UILabel!
    var first: Bool! = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if first {
            let setVC = SetupViewController()
            let filtVC = FilterViewController()
            filtVC.delegate = self
            first = false
            present(setVC, animated: true, completion: nil)
        }
        
        
        
        view.backgroundColor = .white

        routinename = UILabel()
        routinename.text = "Arena name: "
        routinename.font = .systemFont(ofSize: 18)
        routinename.textColor = .black
        routinename.translatesAutoresizingMaskIntoConstraints = false
        
        self.title = "Setup"
        navigationItem.title = "setup"
        
        view.addSubview(routinename)
        
        NSLayoutConstraint.activate([

        routinename.trailingAnchor.constraint(equalTo: view.centerXAnchor),
        routinename.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        
        ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitButtonPressed(withName name: String) {
        print("success")
    }
    
//    
//    @objc func modalButtonPressed(sender: UIButton) {
//        let setVC = SetupViewController()
////        setVC.delegate = self
//        present(setVC, animated: true, completion: nil)
        
//    }


}

