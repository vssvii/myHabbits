//
//  HabitDetailsTableViewCell.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 01.05.2022.
//

import UIKit

let habitDates = HabitsStore.shared.dates

class HabitDetailsTableViewCell: UITableViewCell {

        public lazy var dateLabel: UILabel = {
            let dateLabel = UILabel()
            dateLabel
            return dateLabel
        }()
        
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .default, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(dateLabel)
            
            NSLayoutConstraint.activate([
                dateLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30.0),
                dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            ])
        }
    
        public func update(author: String, description: String, likes: Int, views: Int) {
            dateLabel
        }

    }
