//
//  InformationViewController.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 13.04.2022.
//

import UIKit

class InformationViewController: UIViewController {
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var contentView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = .white
        contenView.translatesAutoresizingMaskIntoConstraints = false
        return contenView
    }()
    
    private lazy var textLabel1: UILabel = {
        let textLabel1 = UILabel()
        textLabel1.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel1.text = "Привычка за 21 день"
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        textLabel1.textColor = .black
        textLabel1.numberOfLines = 0
        return textLabel1
    }()
    
    private lazy var textLabel2: UILabel = {
        let textLabel2 = UILabel()
        textLabel2.font = UIFont.systemFont(ofSize: 17)
        textLabel2.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        textLabel2.textColor = .black
        textLabel2.numberOfLines = 7
        return textLabel2
    }()
    
    private lazy var textLabel3: UILabel = {
        let textLabel3 = UILabel()
        textLabel3.font = UIFont.systemFont(ofSize: 17)
        textLabel3.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        textLabel3.textColor = .black
        textLabel3.numberOfLines = 7
        return textLabel3
    }()
    
    private lazy var textLabel4: UILabel = {
        let textLabel4 = UILabel()
        textLabel4.font = UIFont.systemFont(ofSize: 17)
        textLabel4.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        textLabel4.translatesAutoresizingMaskIntoConstraints = false
        textLabel4.textColor = .black
        textLabel4.numberOfLines = 7
        return textLabel4
    }()
    
    private lazy var textLabel5: UILabel = {
        let textLabel5 = UILabel()
        textLabel5.font = UIFont.systemFont(ofSize: 17)
        textLabel5.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        textLabel5.translatesAutoresizingMaskIntoConstraints = false
        textLabel5.textColor = .black
        textLabel5.numberOfLines = 7
        return textLabel5
    }()
    
    private lazy var textLabel6: UILabel = {
        let textLabel6 = UILabel()
        textLabel6.font = UIFont.systemFont(ofSize: 17)
        textLabel6.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        textLabel6.translatesAutoresizingMaskIntoConstraints = false
        textLabel6.textColor = .black
        textLabel6.numberOfLines = 7
        return textLabel6
    }()
    
    private lazy var textLabel7: UILabel = {
        let textLabel7 = UILabel()
        textLabel7.font = UIFont.systemFont(ofSize: 17)
        textLabel7.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        textLabel7.translatesAutoresizingMaskIntoConstraints = false
        textLabel7.textColor = .black
        textLabel7.numberOfLines = 7
        return textLabel7
    }()
    
    private lazy var textLabel8: UILabel = {
        let textLabel8 = UILabel()
        textLabel8.font = UIFont.systemFont(ofSize: 17)
        textLabel8.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        textLabel8.translatesAutoresizingMaskIntoConstraints = false
        textLabel8.textColor = .black
        textLabel8.numberOfLines = 7
        return textLabel8
    }()
    
    private lazy var textLabel9: UILabel = {
        let textLabel9 = UILabel()
        textLabel9.font = UIFont.systemFont(ofSize: 17)
        textLabel9.text = "Источник: Psychbook.ru"
        textLabel9.translatesAutoresizingMaskIntoConstraints = false
        textLabel9.textColor = .black
        textLabel9.numberOfLines = 7
        return textLabel9
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        contentView.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.addSubview(contentView)
        contentView.addSubview(textLabel1)
        contentView.addSubview(textLabel2)
        contentView.addSubview(textLabel3)
        contentView.addSubview(textLabel4)
        contentView.addSubview(textLabel5)
        contentView.addSubview(textLabel6)
        contentView.addSubview(textLabel7)
        contentView.addSubview(textLabel8)
        contentView.addSubview(textLabel9)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: tableView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textLabel1.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel1.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel1.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel2.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel2.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel2.topAnchor.constraint(equalTo: textLabel1.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel3.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel3.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel3.topAnchor.constraint(equalTo: textLabel2.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel4.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel4.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel4.topAnchor.constraint(equalTo: textLabel3.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel5.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel5.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel5.topAnchor.constraint(equalTo: textLabel4.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel6.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel6.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel6.topAnchor.constraint(equalTo: textLabel5.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel7.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel7.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel7.topAnchor.constraint(equalTo: textLabel6.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel8.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel8.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel8.topAnchor.constraint(equalTo: textLabel7.bottomAnchor, constant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            textLabel9.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            textLabel9.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            textLabel9.topAnchor.constraint(equalTo: textLabel8.bottomAnchor, constant: 16.0)
        ])
    }
}
