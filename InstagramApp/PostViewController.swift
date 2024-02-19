//
//  PostViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/15/24.
//

import UIKit
import SnapKit

class PostViewController: UIViewController{
    private lazy var mainTittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Post"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var addPostDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Post with description that will be added"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15 , weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var addPostButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add post description", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(postDescipton), for: .touchUpInside)
//        button.backgroundColor = .red

        return button
    }()
    private lazy var postDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20 , weight: .medium)
        label.numberOfLines = 0
 
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubViews()
    }
    private func setUpSubViews(){
        view.addSubview(mainTittleLabel)
        mainTittleLabel.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top).offset(60)
            make.horizontalEdges.equalTo(view.alpha)
            
            
        })
        view.addSubview(addPostDescriptionLabel)
        addPostDescriptionLabel.snp.makeConstraints({make in
            make.top.equalTo(mainTittleLabel.snp.bottom).offset(250)
            make.horizontalEdges.equalTo(view.alpha)
            
            
            
        })

        view.addSubview(postDescriptionLabel)
        postDescriptionLabel.snp.makeConstraints({make in

            make.horizontalEdges.equalTo(view.alpha)
            make.center.equalTo(view.snp.center)
          
            
            
            
        })
        view.addSubview(addPostButton)
        addPostButton.snp.makeConstraints({make in
            make.top.equalTo(postDescriptionLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        })
        
        
    }
    @objc private func postDescipton(){
        let view = AddPostViewController()
        let transit = CATransition()
        transit.type = CATransitionType.push
        transit.duration = 0.3
        transit.subtype = CATransitionSubtype.fromTop
        present(view, animated: true, completion: nil)
        
        view.delegate = self
 
    }
  

}
extension PostViewController: AddPostViewControllerDelegate{
    func changeTittle(text: String) {
        postDescriptionLabel.text = text
    }
    
    
}
