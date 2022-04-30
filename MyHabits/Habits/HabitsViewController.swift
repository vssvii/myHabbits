//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 20.04.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    let store = HabitsStore.shared
    
    private lazy var habitLabel: UILabel = {
        let habitLabel = UILabel()
        habitLabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        habitLabel.text = "Сегодня"
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        habitLabel.textColor = .black
        habitLabel.numberOfLines = 1
        return habitLabel
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    @objc func toHabitDetails(sender: UIBarButtonItem!) {
        let habitDetails = HabitViewController()
        habitDetails.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(habitDetails, animated: true)
    }
    
    private enum LayoutCostant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 100.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(habitLabel)
        view.addSubview(collectionView)

        
        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: habitLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        addHabit()
        setupViews()
        collectionView.reloadData()
    }
    
    private func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
    }
    
    func addHabit() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addHabitAction))
    }
    
    @objc func addHabitAction(sender: UIBarButtonItem!) {
        let habitViewController = HabitViewController()
        habitViewController.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(habitViewController, animated: true)
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as! HabitCollectionViewCell
        let habit = store.habits[indexPath.row]
        cell.setup(with: habit)
        return cell
    }
}

extension HabitsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(store.habits[indexPath.row])
        let habitDetails = HabitDetailsViewController()
        navigationController?.pushViewController(habitDetails, animated: true)
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: LayoutCostant.spacing)
        return CGSize(width: view.frame.width, height: 180.0)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 5
        let totalSpasing: CGFloat = 5
        let finalWidth = (width - totalSpasing) / itemsInRow
        return floor(CGFloat(finalWidth))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutCostant.spacing, left: LayoutCostant.spacing, bottom: LayoutCostant.spacing, right: LayoutCostant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutCostant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutCostant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Did select cell at \(indexPath.row)")
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
