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
    }


}
