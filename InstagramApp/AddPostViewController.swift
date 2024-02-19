//
//  AddPostViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/18/24.
//

import UIKit
import SnapKit

protocol AddPostViewControllerDelegate: AnyObject{
    func changeTittle(text: String)
}

class AddPostViewController: UIViewController {
  
    var delegate: AddPostViewControllerDelegate?
    
    private lazy var mainTittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Post Description"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    private lazy var inputLabel: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter post description"
        text.addTarget(self, action: #selector(changeText), for: .editingChanged)
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return text
    }()
    private lazy var addPostButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Post", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(savePost), for: .touchUpInside)

        return button
    }()
    override func viewDidLoad() {
  
        
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTittleLabel)
        mainTittleLabel.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top).offset(60)
            make.horizontalEdges.equalTo(view.alpha)
            
            
        })
        view.addSubview(inputLabel)
        inputLabel.snp.makeConstraints({make in
            make.center.equalTo(view.snp.center)
            make.horizontalEdges.equalTo(view.alpha)
        })
        view.addSubview(addPostButton)
        addPostButton.snp.makeConstraints({make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(inputLabel.snp.bottom).offset(50)
          
            
            
            
        })
        
        
    }
  
    @objc private func changeText(){
        let teleport = PostViewController()
   
    }
    @objc private func savePost(){
        delegate?.changeTittle(text: inputLabel.text ?? "")
        dismiss(animated: true, completion: nil)
      
    }
    
    
    


}
