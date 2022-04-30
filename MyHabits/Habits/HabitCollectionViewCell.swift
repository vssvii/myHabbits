//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 24.04.2022.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

let store = HabitsStore.shared

let habit = HabitViewController()

public var counterHabit: Int = {
    var counter = Int()
    counter = 0
    return counter
}()


class HabitCollectionViewCell: UICollectionViewCell {
    
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.numberOfLines = 0
        nameLabel.font = .boldSystemFont(ofSize: 22.0)
        return nameLabel
    }()
    
    private let time: UILabel = {
        let time = UILabel(frame: .zero)
        time.text = store.trackDateString(forIndex: 1)
        return time
    }()
    
    private var countLabel: UILabel = {
        let countLabel = UILabel(frame: .zero)
        countLabel.text = "Счетчик:" + String(counterHabit)
        countLabel.numberOfLines = 0
        return countLabel
    }()
    
//    private var editButton: UIButton = {
//        let editButton = UIButton()
//        editButton.setTitle("Изменить", for: .normal)
//        editButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//        editButton.layer.shadowRadius = 4
//        editButton.layer.shadowColor = UIColor.black.cgColor
//        editButton.layer.shadowOpacity = 0.7
//        editButton.tintColor = .white
//        editButton.addTarget(self, action: #selector(editHabit), for: .touchUpInside)
//        return editButton
//    }()
//
//    @objc func editHabit(sender: UIBarButtonItem!) {
//        let habitDetails = HabitDetailsViewController()
//        habitDetails.modalPresentationStyle = .overCurrentContext
//    }
    
    
    
    private lazy var checkBox: UIButton = {
        let checkBox = UIButton()
        checkBox.setImage(UIImage(systemName: "circle"), for: .normal)
        checkBox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        checkBox.layer.borderWidth = 0.5
//        checkBox.layer.borderColor = UIColor.secondaryLabel.cgColor
        checkBox.layer.cornerRadius = 15.0
        checkBox.clipsToBounds = true
        checkBox.layer.borderColor = UIColor.darkGray.cgColor
        checkBox.addTarget(self, action: #selector(setChecked), for: .touchUpInside)
//        circle.layer.borderWidth = 2.0
        return checkBox
    }()
    
    @objc func setChecked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            store.track(Habit.init(name: nameLabel.text!, date: habit.datePicker.date, color: .systemBlue))
            counterHabit = counterHabit + 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(time)
        contentView.addSubview(countLabel)
        contentView.addSubview(checkBox)
//        contentView.addSubview(editButton)
    }
    
    private func setupLayouts() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        time.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        checkBox.translatesAutoresizingMaskIntoConstraints = false
//        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),

            time.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16.0),
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),

            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            countLabel.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 16.0),

            checkBox.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16.0),
            checkBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            
//            editButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 16.0),
//            editButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
//            editButton.widthAnchor.constraint(equalToConstant: 120.0)
        ])
    }
    
    func setup(with habit: Habit) {
        nameLabel.text = habit.name
        nameLabel.textColor = habit.color
        time.text = habit.dateString
        checkBox.tintColor = habit.color
//        editButton.backgroundColor = habit.color
    }
}

extension HabitCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
