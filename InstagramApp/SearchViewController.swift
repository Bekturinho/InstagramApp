//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/15/24.
//
import UIKit
import SnapKit
class SearchViewController: UIViewController{
    private lazy var tableView = UITableView()
    
    private lazy var mainTittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    
    private lazy var instaSearchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Введите имя аккаунта"
        view.delegate = self
        view.showsCancelButton = true
        return view
    }()
    
    private lazy var filteredInstaNick: [InstagramIfo] = []
    
    private lazy var isSearching: Bool = {
        guard let text = instaSearchBar.text else{return false}
        return !text.isEmpty
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
        navigationItem.title = "Search"
      
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
        
        view.addSubview(instaSearchBar)
        instaSearchBar.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top).offset(100)
            make.centerX.equalTo(view.snp.centerX)
            make.horizontalEdges.equalTo(view.alpha)
            
        })
    }

}
extension SearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filteredInstaNick.count
        }else{
           return instaInfoArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? InstaTableViewCell
        let userInfo = instaInfoArray[indexPath.row]
        let nick = isSearching ? filteredInstaNick[indexPath.row] : instaInfoArray[indexPath.row]
        cell?.textLabel?.text = nick.nickName
        if let cell{
            cell.putInfo(info: userInfo)
            return cell
        }else {
            return UITableViewCell()
        }
        
  
       
      
            
    }
    
    
}
extension SearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }

}



extension SearchViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     filteredInstaNick = instaInfoArray.filter({$0.nickName.contains(searchText.lowercased())})
        tableView.reloadData()
        
    }
}
