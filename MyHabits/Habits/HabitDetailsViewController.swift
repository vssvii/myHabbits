//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 30.04.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    let dateInfo = HabitsStore.shared.dates
    
    private var activeNameLabel: UILabel = {
        let activeNameLabel = UILabel()
        activeNameLabel.text = "Активность"
        activeNameLabel.textColor = .lightGray
        activeNameLabel.font = .boldSystemFont(ofSize: 18.0)
        return activeNameLabel
    }()
    
    private var dateTableView: UITableView = {
        let dateTableView = UITableView()
        return dateTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.addSubview(activeNameLabel)
        view.addSubview(dateTableView)
    }
    
    private func setupLayouts() {
        activeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activeNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            activeNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),

            dateTableView.topAnchor.constraint(equalTo: activeNameLabel.bottomAnchor, constant: 16.0),
            dateTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dateTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dateTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
