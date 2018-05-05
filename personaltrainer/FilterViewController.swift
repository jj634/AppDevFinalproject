//
//  FilterViewController.swift
//  personaltrainer
//
//  Created by Jason Jung on 4/26/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import UIKit

protocol SaveButtonDelegate1 {
    func submitButtonPressed(withName name: String)
}

class FilterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var routinecollectionView: UICollectionView!
    var filtercollectionView: UICollectionView!
    
    let insetConstant: CGFloat = 8.0
    let reuserestrCell = "reuseCollectionViewCell"
    let reusefilterCell = "reuseCollectionViewCell1"
    
    var delegate: SaveButtonDelegate1?

//
//    let r1 = Routine(name: "Live Fit", lvl: "Intermediate", goal: "Weight Loss", image: "prof", selected: false, link: URL(string: "https://www.apple.com")!)
//    let r2 = Routine(name: "Bench 300", lvl: "Intermediate", goal: "Strength", image: "prof", selected: false, link: URL(string: "https://www.google.com")!)
//    let r3 = Routine(name: "Home Body", lvl: "Beginner", goal: "Stay Fit", image: "prof", selected: false, link: URL(string: "https://www.apple.com")!)
//    let r4 = Routine(name: "Duel", lvl: "Advanced", goal: "Stay Fit", image: "prof", selected: false, link: URL(string: "https://www.apple.com")!)
//

    


    var routines: [Routine] = []
    
    
    let filter1 = Filter(name: "Easy", selected: false)
    let filter2 = Filter(name: "Medium", selected: false)
    let filter3 = Filter(name: "Hard", selected: false)
    let filter4 = Filter(name: "Weight Loss", selected: false)
    let filter5 = Filter(name: "Strength", selected: false)
    let filter6 = Filter(name: "Stay Fit", selected: false)

    var filters: [Filter] = []
    
    
    
    var filts: [String] = []
    var mealfilts: [String] = []
    var currentroutine: Routine?
    
    var dismissButton: UIButton!
    var submitButton: UIButton!
    
    var deleteButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Network.getRoutines(withQuery: "searchText") { (routines) in
            self.routines = routines
            self.routinecollectionView.reloadData()
            print("done")
            print(routines)
        }
        
        
        title = "Fitness Routines"
        
//        routines.append(contentsOf: [r1, r2, r3, r4])
        filters.append(contentsOf: [filter1, filter2, filter3, filter4, filter5, filter6])
        
        let restrlayout = UICollectionViewFlowLayout()
        let filterlayout = UICollectionViewFlowLayout()
        
        filterlayout.scrollDirection = .horizontal
        

        
        
        routinecollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: restrlayout)
        routinecollectionView.backgroundColor = .white
        
        
        filtercollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: filterlayout)
        filtercollectionView.backgroundColor = .white
        
        //Setting the delegate and the datasource of this collectionview to be self, which is the
        //ViewController class. Again, following the standard conventions of the MVC model.
        routinecollectionView.delegate = self
        routinecollectionView.dataSource = self
        routinecollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        filtercollectionView.delegate = self
        filtercollectionView.dataSource = self
        filtercollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        routinecollectionView.register(RoutineCollectionViewCell.self, forCellWithReuseIdentifier: reuserestrCell)
        filtercollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: reusefilterCell)
        
        
        dismissButton = UIButton()
        dismissButton.setTitle("Back", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        dismissButton.backgroundColor = .blue
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.layer.cornerRadius = 10
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.backgroundColor = .green
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 10
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        deleteButton = UIButton()
        deleteButton.setTitle("Delete Account", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        deleteButton.backgroundColor = .red
        deleteButton.setTitleColor(.white, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(routinecollectionView)
        view.addSubview(filtercollectionView)
        view.addSubview(dismissButton)
        view.addSubview(submitButton)
        view.addSubview(deleteButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            routinecollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            routinecollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            routinecollectionView.topAnchor.constraint(equalTo: filtercollectionView.bottomAnchor),
            routinecollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            filtercollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filtercollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filtercollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filtercollectionView.heightAnchor.constraint(equalToConstant: 24)
            ])
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            dismissButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -16),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.bottomAnchor.constraint(equalTo: deleteButton.topAnchor, constant: -16)
            ])
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.bottomAnchor.constraint(equalTo: deleteButton.topAnchor, constant: -16)
            ])

        NSLayoutConstraint.activate([
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
        
        
    }
    
    @objc func dismissButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func submitButtonPressed(sender: UIButton) {
        print("asd")
        if let name = currentroutine {
//            delegate?.submitButtonPressed(withName: name)
            
            
            
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    @objc func deleteButtonPressed(sender: UIButton) {
        Network.deleteRoutines(withQuery: "no") { (routines) in
            
            print("234")
        }
    }

    
    //Necessary for conforming to DataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Does anyone remember how to get the row number of a certain cell in this function??
        //In UITableView -- it is indexPath.row. And yes! This is still a valid variable in UICollectionView
        //However, because of the slight different nature of UIC vs UIT, we will be using indexPath.item.
        
        if collectionView == self.routinecollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: reuserestrCell, for: indexPath) as! RoutineCollectionViewCell
            cellA.nameLabel.text = routines[indexPath.item].name
            
            let name = routines[indexPath.item].name
            let lvl = routines[indexPath.item].lvl
            let goal = routines[indexPath.item].goal
            let link = routines[indexPath.item].link
            
            let total = [lvl, goal]
            let total1 = [goal, lvl]
            
            cellA.nameLabel.text = name
            cellA.lvlLabel.text = lvl
            cellA.goalLabel.text = goal
            cellA.detailslink = link
            print("sd")
            
           
            
            if routines[indexPath.item].selected {
                
                cellA.layer.borderWidth = 5.0
                cellA.layer.borderColor = UIColor.yellow.cgColor
                
            } else {
                cellA.layer.borderWidth = 0
            }
            
            if filts != [] {
                cellA.contentView.isHidden = true

                if total == filts || total1 == filts || [lvl] == filts || [goal] == filts {
                    cellA.contentView.isHidden = false
                }
                
            } else {
                cellA.contentView.isHidden = false
                
            }
            
            
            cellA.setNeedsUpdateConstraints()
            return cellA
        }
            
        else { // filter collection view
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: reusefilterCell, for: indexPath) as! FilterCollectionViewCell
            cellB.contentView.layer.cornerRadius = 5
            cellB.contentView.layer.borderWidth = 2
            cellB.contentView.layer.borderColor = UIColor.blue.cgColor
            
            if filters[indexPath.item].selected {
                cellB.contentView.backgroundColor = .white
            } else {
                cellB.contentView.backgroundColor = .red
            }
            
            cellB.filterLabel.text = filters[indexPath.item].name
            
            
            cellB.setNeedsUpdateConstraints()
            return cellB
        }
        
        
        
    }
    
    
    
    
    
    //This returns the number of items that will be inside a section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.routinecollectionView {
            return routines.count
        }
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.filtercollectionView {
            filters[indexPath.item].selected = !filters[indexPath.item].selected
            print(filters[indexPath.item].selected)
            let newfilt = filters[indexPath.item].name
            if filters[indexPath.item].selected {
                filts.append(newfilt)
            } else if !filters[indexPath.item].selected && filts.contains(newfilt) {
                filts = filts.filter{$0 != newfilt}
            }
            
            print(filts)
            print(mealfilts)
            routinecollectionView.reloadData()
            filtercollectionView.reloadData()
        } else {
            for routine in routines {
                routine.selected = false }
            routines[indexPath.item].selected = !routines[indexPath.item].selected
            currentroutine = routines[indexPath.item]

  
            routinecollectionView.reloadData()
            filtercollectionView.reloadData()
        }
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.routinecollectionView {
            return CGSize(width: (view.frame.width-32)/2, height: 64)
        }
        
        
        return CGSize(width: 96, height: 24)
        
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //UIEdgeInset object is a way to telling to view how to add "padding" to its view.
        //It tells the rectangle how to shrink/expand the area represented by the rectangle.
        return UIEdgeInsetsMake(insetConstant, insetConstant, insetConstant, insetConstant)

    }
}
