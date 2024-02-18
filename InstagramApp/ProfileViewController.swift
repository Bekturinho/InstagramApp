//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/15/24.
//

import UIKit
import SnapKit
struct Options{
    var title: String
    var image: UIImage
}
public var totalResult = ""
//"Сменить аватарку","Язык приложения","Конфиденциальность и безопасность","Выход из аккаунта"
class ProfileViewController: UIViewController{
    private lazy var tableView = UITableView()
    
    private var optionsArray: [Options] = [
        Options(title: "Сменить аватарку", image: UIImage(systemName: "person.crop.circle") ?? UIImage()),
        Options(title: "Язык приложения", image: UIImage(systemName: "globe") ?? UIImage()),
        Options(title: "Kонфиденциальность и безопасность", image: UIImage(systemName: "person.badge.key") ?? UIImage()),
        Options(title: "Выход из аккаунта", image: UIImage(systemName: "door.left.hand.open") ?? UIImage()),
    
    ]
    
    
    private lazy var mainTittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
      setUpSubViews()
       
        
    }
    private func setUpSubViews(){
        navigationItem.title = "HELLO"
        navigationItem.titleView?.tintColor = .red
        view.addSubview(mainTittleLabel)
        mainTittleLabel.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top).offset(60)
            make.horizontalEdges.equalTo(view.alpha)
            
            
        })
        view.addSubview(tableView)
        tableView.snp.makeConstraints({make in
            make.top.equalTo(mainTittleLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.alpha)
            make.bottom.equalTo(view.snp.bottom)
            
        })

    }


}

extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let options = optionsArray[indexPath.row]
        cell.textLabel?.text = options.title
        cell.imageView?.image = options.image
        cell.accessoryType = .disclosureIndicator
        
    
        return cell
    }
    
    
}

extension ProfileViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultView = ResultViewController()
        navigationController?.pushViewController(resultView, animated: true)
        let total = optionsArray[indexPath.row]
        totalResult = total.title
        print(totalResult)
    }
}
