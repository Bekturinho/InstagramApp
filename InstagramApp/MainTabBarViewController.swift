//
//  MainTabBarViewController.swift
//  InstagramApp
//
//  Created by fortune cookie on 2/15/24.
//

import UIKit
import SnapKit

class MainTabBarViewController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewControllers()
        tabBar.backgroundColor = .white
        tabBar.selectedImageTintColor = .black
        tabBar.unselectedItemTintColor = .systemGray
    }
    

    private func setUpViewControllers(){
        let home = generateViewControllers(title: "", image:UIImage(systemName: "house"), vc: HomeViewController())
        let search = generateViewControllers(title: "", image: UIImage(systemName: "magnifyingglass"), vc: SearchViewController())
        let post = generateViewControllers(title: "", image: UIImage(systemName: "plus.app"), vc: PostViewController())
        let saved = generateViewControllers(title: "", image: UIImage(systemName: "star"), vc: SavedViewController())
        let profile = generateViewControllers(title: "", image: UIImage(systemName: "person.crop.circle"), vc: ProfileViewController())
        
        setViewControllers([home,search,post,saved,profile], animated: false)
        
        
    }
    private func generateViewControllers(title: String, image: UIImage?, vc: UIViewController) -> UIViewController{
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        
        
        
        return vc
    }
}
