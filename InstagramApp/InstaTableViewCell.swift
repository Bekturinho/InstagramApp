//
//  InstaTableViewCell.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/16/24.
//

import UIKit
import SnapKit

class InstaTableViewCell: UITableViewCell {

    private lazy var instaNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var instaProfileImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    private lazy var instaPostImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    private lazy var instaPostLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setUpSubViews()
    }

    
    private func setUpSubViews(){
        addSubview(instaProfileImage)
        instaProfileImage.snp.makeConstraints({make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(40)
            make.size.equalTo(CGSize(width: 40, height: 40))
            instaProfileImage.layer.borderWidth = 1
            instaProfileImage.layer.cornerRadius = 20
            instaProfileImage.layer.masksToBounds = true
            
        })
        addSubview(instaNameLabel)
        instaNameLabel.snp.makeConstraints({make in
            make.left.equalTo(instaProfileImage.snp.right).offset(10)
            make.top.equalToSuperview().offset(50)
            
        })
        addSubview(instaPostImage)
        instaPostImage.snp.makeConstraints({make in
            make.top.equalTo(instaNameLabel.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: 400, height: 400))
            make.horizontalEdges.equalToSuperview()
            
        })
        addSubview(instaPostLabel)
        instaPostLabel.snp.makeConstraints({make in
            make.top.equalTo(instaPostImage.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
           
            
            
        })
    }
    public func putInfo(info: InstagramIfo){
        instaNameLabel.text = info.nickName
        instaPostImage.image = info.postPhoto
        instaProfileImage.image = info.profilePhoto
        
        instaPostLabel.text = info.postText
    }
}
