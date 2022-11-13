//
//  ResultViewController.swift
//  TapperFighter
//
//  Created by Utku Gökçen on 13.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(Globals.UserDefaults.user)
        scoreListTableView.dataSource = self
//        scoreListTableView.delegate = self
        
        registerCell()
        scoreListTableView.reloadData()
    }
    
    func registerCell(){
        let nib = UINib(nibName: String(describing: ScoreCell.self), bundle: .main)
        scoreListTableView.register(nib, forCellReuseIdentifier: "ScoreCell")
    }
    

}

extension ResultViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Globals.UserDefaults.user?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = Globals.UserDefaults.user?[indexPath.row] else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as? ScoreCell {
            cell.config(user: user)
            return cell
        }
        
        return UITableViewCell()
    }
}

/*
 extension ResultViewController: UITableViewDelegate{
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 return 60
 }
 
 
 }
 */
