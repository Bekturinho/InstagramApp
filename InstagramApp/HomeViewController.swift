//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/15/24.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController{
    private lazy var tableView = UITableView()
    private lazy var mainTittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    private var instaInfoArray: [InstagramIfo] = [
        InstagramIfo(profilePhoto: UIImage(named: "guts") ?? UIImage(), nickName: "guts", postPhoto: UIImage(named: "guts") ?? UIImage(), postText: "Что вершит судьбу человечества в этом мире? Некое незримое существо или закон, подобно Длани Господней парящей над миром? По крайне мере истинно то, что человек не властен даже над своей волей."),
        InstagramIfo(profilePhoto: UIImage(named: "blackguts") ?? UIImage(), nickName: "nigga_guts", postPhoto: UIImage(named: "blackguts") ?? UIImage(), postText: "И вот так, я продолжаю идти по этому проклятому пути, пока моя сила еще со мной. Я буду продолжать бороться, пока не достигну своей цели."),
        InstagramIfo(profilePhoto: UIImage(named: "blackguts") ?? UIImage(), nickName: "muslim", postPhoto: UIImage(named: "muslim") ?? UIImage(), postText: "Каждая душа вкусит смерть"),
        InstagramIfo(profilePhoto: UIImage(named: "profile") ?? UIImage(), nickName: "blackguts", postPhoto: UIImage(named: "islam") ?? UIImage(), postText: "Аллах с терпеливыми"),
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        setUpSubViews()
    }
    
    
    private func setUpSubViews(){
        
        view.addSubview(mainTittleLabel)
        mainTittleLabel.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top).offset(60)
            make.horizontalEdges.equalTo(view.alpha)
            
            
        })
        guard let navigationController else {return}
        view.addSubview(tableView)
        tableView.register(InstaTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
                tableView.snp.makeConstraints({make in
            make.top.equalTo(navigationController.navigationBar.snp.bottom ).offset(20)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        })
    }

}
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instaInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? InstaTableViewCell
        let userInfo = instaInfoArray[indexPath.row]
        if let cell{
            cell.putInfo(info: userInfo)
            return cell
        }else {
            return UITableViewCell()
        }
       
            
    }
    
    
}
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
