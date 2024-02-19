//
//  SavedViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/15/24.
//

import UIKit
import SnapKit
class SavedViewController: UIViewController{
    private lazy var mainTittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    private lazy var quotesArray: [String] = []

    private lazy var addNoteButton: UIButton = {
        let showAlertAction = UIAction{_ in 
            var textfield = UITextField()
            let alert = UIAlertController(title: "Add favourite quote", message: nil, preferredStyle: .alert)
            let addQuoteAction = UIAlertAction( title: "Add", style: .default){ _ in
                let text = textfield.text
                self.quotesArray.append(text ?? "")
                self.tableView.reloadData()
                
            }
            let cancelAction = UIAlertAction( title: "Cancel", style: .cancel)
            
            alert.addTextField{ text in
                text.placeholder = "Enter quote"
                textfield = text
            }
            alert.addAction(addQuoteAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
            
        }
        let button = UIButton(primaryAction: showAlertAction)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
      
       
        
     
        return button
        
    }()
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubViews()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func setUpSubViews(){

        view.addSubview(mainTittleLabel)
        mainTittleLabel.snp.makeConstraints({make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
            
        })
        view.addSubview(addNoteButton)
        addNoteButton.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(60)
            make.width.height.equalTo(view.alpha).offset(100)
            make.right.equalToSuperview().offset(-20)
        })
        view.addSubview(tableView)
        tableView.snp.makeConstraints({make in
            make.top.equalTo(mainTittleLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.alpha)
            make.bottom.equalTo(view.snp.bottom)
            
        })
    }

}
extension SavedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotesArray.count
          }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = quotesArray[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }
    
    
}

extension SavedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            quotesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
