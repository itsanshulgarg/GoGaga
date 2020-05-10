//
//  ProfileViewController.swift
//  GoGaga
//
//  Created by Anshul Garg on 08/05/20.
//  Copyright © 2020 Anshul Garg. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var countBarView: UIView!
    @IBOutlet weak var settingsButtonTableView: UITableView!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var countBarFullView: UIView!
    @IBOutlet weak var countBarHeight: NSLayoutConstraint!
    
    let array1 = ["Match Preferences", "Configuration", "Leaderboard"]
    let array2 = ["Choose desired age for matches", "Change preferences of the app","Check where you are flying on board"]
     var bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButtonTableView.delegate = self
        settingsButtonTableView.dataSource = self
        settingsButtonTableView.register(UINib(nibName: "TableViewCell", bundle: nil) , forCellReuseIdentifier: "cell")
        
        
        countBarView.layer.shadowPath = UIBezierPath(roundedRect: countBarView.bounds, cornerRadius: self.countBarView.layer.cornerRadius).cgPath
        countBarView.layer.shadowRadius = 5
        countBarView.layer.shadowOffset = CGSize(width: 0, height: 10)
        countBarView.layer.shadowOpacity = 0.4
        
        shareButton.layer.shadowPath = UIBezierPath(roundedRect: shareButton.bounds, cornerRadius: self.shareButton.layer.cornerRadius).cgPath
        shareButton.layer.shadowRadius = 5
        shareButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        shareButton.layer.shadowOpacity = 0.4
        
        supportButton.layer.shadowPath = UIBezierPath(roundedRect: supportButton.bounds, cornerRadius: self.supportButton.layer.cornerRadius).cgPath
        supportButton.layer.shadowRadius = 5
        supportButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        supportButton.layer.shadowOpacity = 0.4
        
        bioLabel.text = "Loves Vali icecream!"
        bioLabel.sizeToFit()
        bioLabel.numberOfLines = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        countBarView.addGestureRecognizer(tap)
        countBarFullView.isHidden = true
         settingsButtonTableView.frame = CGRect(x: 20, y: 300, width: 376, height: 268)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.settingLabel.text = array1[indexPath.section]
        cell.settingsInfoLabel.text = array2[indexPath.section]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        bool.toggle()
        if bool == true{
            countBarFullView.isHidden = false
            settingsButtonTableView.frame = CGRect(x: 20, y: 440, width: 376, height: 268)
        }
        else{
            countBarFullView.isHidden = true
            settingsButtonTableView.frame = CGRect(x: 20, y: 300, width: 376, height: 268)
        }
    }

}
