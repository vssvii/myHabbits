//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 20.04.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    let store = HabitsStore.shared
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = .white
        contenView.translatesAutoresizingMaskIntoConstraints = false
        return contenView
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "НАЗВАНИЕ"
        name.font = .boldSystemFont(ofSize: 13.0)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var text: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.font = .boldSystemFont(ofSize: 17.0)
        text.keyboardAppearance = .default
        text.keyboardType = .default
        text.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.text = "ЦВЕТ"
        colorLabel.font = .boldSystemFont(ofSize: 13.0)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        return colorLabel
    }()
    
    public lazy var circle: UIButton = {
        let circle = UIButton()
        circle.layer.cornerRadius = 15.0
        circle.clipsToBounds = true
        circle.backgroundColor = circle.backgroundColor
        circle.layer.borderColor = UIColor.darkGray.cgColor
        circle.layer.borderWidth = 2.0
        circle.addTarget(self, action: #selector(colorPick), for: .touchUpInside)
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    @objc func colorPick() {
        let picker = UIColorPickerViewController()
        circle.backgroundColor = picker.selectedColor
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "ВРЕМЯ"
        timeLabel.font = .boldSystemFont(ofSize: 13.0)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    private lazy var dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.text = "Каждый день в " + dateFormatter.string(from: datePicker.date)
        dayLabel.font = .systemFont(ofSize: 17.0)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        return dayLabel
    }()
    
    public lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        datePicker.addTarget(self, action: #selector(setTime), for: .touchUpInside)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
//    @objc func dateToString (sender: UIDatePicker) {
//        var timeFormatter = DateFormatter()
//        timeFormatter.timeStyle = DateFormatter.Style.short
//        var strDate = timeFormatter.string(from: datePicker.date)
//    }
    
    @objc func setTime (sender: UIDatePicker) -> String {
        let setTimer = dateFormatter.string(from: datePicker.date)
        return setTimer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Cоздать"
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(name)
        contentView.addSubview(text)
        contentView.addSubview(colorLabel)
        contentView.addSubview(circle)
        contentView.addSubview(timeLabel)
        contentView.addSubview(datePicker)
        contentView.addSubview(dayLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: name.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            colorLabel.topAnchor.constraint(equalTo: text.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            colorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            circle.topAnchor.constraint(equalTo: colorLabel.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            circle.heightAnchor.constraint(equalToConstant: 30.0),
            circle.widthAnchor.constraint(equalToConstant: 30.0)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: circle.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: timeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 16.0),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
//            datePicker.leftAnchor.constraint(equalTo: dayLabel.safeAreaLayoutGuide.rightAnchor, constant: 8.0),
//            datePicker.topAnchor.constraint(equalTo: timeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 10.0)
            datePicker.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 16.0),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0)
        ])
        
        statusHabit()
    }
    
    func statusHabit() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButtonAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelButtonAction))
    }
    
    @objc func cancelButtonAction(sender: UIBarButtonItem!) {
        let cancel = HabitsViewController()
        print(store.habits)
        navigationController?.pushViewController(cancel, animated: true)
    }
    @objc func saveButtonAction(sender: UIBarButtonItem!) {
        let newHabit = Habit(name: text.text!, date: datePicker.date, color: circle.backgroundColor!)
        store.habits.append(newHabit)
        let save = HabitsViewController()
        navigationController?.pushViewController(save, animated: true)
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ HabitViewController: UIColorPickerViewController) {
        circle.backgroundColor = HabitViewController.selectedColor
        text.textColor = HabitViewController.selectedColor
    }
    
    //  Called on every color selection done in the picker.
    func colorPickerViewControllerDidSelectColor(_ HabitViewController: UIColorPickerViewController) {
        circle.backgroundColor = HabitViewController.selectedColor
        text.textColor = HabitViewController.selectedColor
    }
    
}
