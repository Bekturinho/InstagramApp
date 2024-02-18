//
//  ResultViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/17/24.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    private lazy var totalResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = totalResult
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(totalResultLabel)
        totalResultLabel.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top).offset(100)
            make.horizontalEdges.equalTo(view.alpha)
        })
    }
    
    
    public func changeTittle(name: String){
        totalResultLabel.text = name
    }

}

