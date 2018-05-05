//
//  SetupViewController.swift
//  personaltrainer
//
//  Created by Jason Jung on 4/26/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    
    
    var image: UIImageView!
    var nametext: UITextField!
    var agetext: UITextField!
    var gendertext: UITextField!
    var weighttext: UITextField!
    var heighttext: UITextField!
    
    var namelabel: UILabel!
    var agelabel: UILabel!
    var genderlabel: UILabel!
    var weightlabel: UILabel!
    var heightlabel: UILabel!
    
    
    
    var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        image = UIImageView()
        image.image = UIImage(named: "prof")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        namelabel = UILabel()
        namelabel.text = "Name: "
        namelabel.font = .systemFont(ofSize: 18)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        
        nametext = UITextField()
        nametext.text = ""
        nametext.borderStyle = .roundedRect
        nametext.translatesAutoresizingMaskIntoConstraints = false
        
        agelabel = UILabel()
        agelabel.text = "Age: "
        agelabel.font = .systemFont(ofSize: 18)
        agelabel.translatesAutoresizingMaskIntoConstraints = false
        
        agetext = UITextField()
        agetext.text = ""
        agetext.borderStyle = .roundedRect
        agetext.translatesAutoresizingMaskIntoConstraints = false
        
        genderlabel = UILabel()
        genderlabel.text = "Gender: "
        genderlabel.font = .systemFont(ofSize: 18)
        genderlabel.translatesAutoresizingMaskIntoConstraints = false
        
        gendertext = UITextField()
        gendertext.text = ""
        gendertext.borderStyle = .roundedRect
        gendertext.translatesAutoresizingMaskIntoConstraints = false
        
        weightlabel = UILabel()
        weightlabel.text = "Weight (lb): "
        weightlabel.font = .systemFont(ofSize: 18)
        weightlabel.translatesAutoresizingMaskIntoConstraints = false
        
        weighttext = UITextField()
        weighttext.text = ""
        weighttext.borderStyle = .roundedRect
        weighttext.translatesAutoresizingMaskIntoConstraints = false
        
        heightlabel = UILabel()
        heightlabel.text = "Height (inches): "
        heightlabel.font = .systemFont(ofSize: 18)
        heightlabel.translatesAutoresizingMaskIntoConstraints = false
        
        heighttext = UITextField()
        heighttext.text = ""
        heighttext.borderStyle = .roundedRect
        heighttext.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton = UIButton()
        dismissButton.setTitle("Next", for: .normal)
        dismissButton.addTarget(self, action: #selector(pushfilterviewcontroller), for: .touchUpInside)
        dismissButton.backgroundColor = .green
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.layer.cornerRadius = 10
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        
        view.addSubview(image)
        
        view.addSubview(namelabel)
        view.addSubview(nametext)
        view.addSubview(agelabel)
        view.addSubview(agetext)
        view.addSubview(genderlabel)
        view.addSubview(gendertext)
        view.addSubview(weightlabel)
        view.addSubview(weighttext)
        view.addSubview(heightlabel)
        view.addSubview(heighttext)
        
        view.addSubview(dismissButton)
        
        
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            
            ])
        
        setupconstraints()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupconstraints() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            
            
            namelabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
            namelabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 48),
            nametext.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            nametext.centerYAnchor.constraint(equalTo: namelabel.centerYAnchor),
            nametext.widthAnchor.constraint(equalToConstant: 150),
            
            
            agelabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
            agelabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 16),
            agetext.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            agetext.centerYAnchor.constraint(equalTo: agelabel.centerYAnchor),
            agetext.widthAnchor.constraint(equalToConstant: 150),
            
            
            genderlabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
            genderlabel.topAnchor.constraint(equalTo: agelabel.bottomAnchor, constant: 16),
            gendertext.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            gendertext.centerYAnchor.constraint(equalTo: genderlabel.centerYAnchor),
            gendertext.widthAnchor.constraint(equalToConstant: 150),
            
            
            weightlabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
            weightlabel.topAnchor.constraint(equalTo: genderlabel.bottomAnchor, constant: 16),
            weighttext.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            weighttext.centerYAnchor.constraint(equalTo: weightlabel.centerYAnchor),
            weighttext.widthAnchor.constraint(equalToConstant: 150),
            
            
            heightlabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
            heightlabel.topAnchor.constraint(equalTo: weightlabel.bottomAnchor, constant: 16),
            heighttext.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            heighttext.centerYAnchor.constraint(equalTo: heightlabel.centerYAnchor),
            heighttext.widthAnchor.constraint(equalToConstant: 150)
            
            
            
            
            
            ])
    }
    
    
    @objc func pushfilterviewcontroller(sender: UIButton) {
        print("f")
        let filtVC = FilterViewController()
//        navigationController?.pushViewController(filtVC, animated: true)
        
        let stuff = [nametext.text!, agetext.text!, heighttext.text!, weighttext.text!, gendertext.text!]
        
        Network.postRoutines(withQuery: stuff) { (routines) in
            
            print("234")
        }
        
        
        
        filtVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(filtVC, animated: true, completion: nil)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
