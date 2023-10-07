//
//  RankVC.swift
//  ChihoGuesser
//
//  Created by gkin on 2023/08/20.
//

import UIKit




class RankVC: UIViewController{
    
    let table = UITableView()
    var scores = [Score(score: 1200, name: "Aさん"), Score(score: 1950, name: "Dさん"),
                            Score(score: 2500, name: "Bさん"), Score(score: 2930, name: "Eさん"),
                            Score(score: 3300, name: "Fさん"),Score(score: 3760, name: "Cさん")]
    
        
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        
        let imgView = UIImageView(image: UIImage(named: "haikei"))
        
        view.addSubview(imgView)
        imgView.frame = view.bounds
        
        
        view.addSubview(table)
        table.frame = view.bounds
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.register(rankCell.self, forCellReuseIdentifier: "rankCell")
    }
}



extension RankVC: UITableViewDelegate, UITableViewDataSource{
    
    //cell の数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    //cell の中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankCell", for: indexPath) as! rankCell
        
        cell.setCellView()
        cell.numberlabel.text = "\(indexPath.row)"
        cell.nameLabel.text = "\(scores[indexPath.row].name)"
        cell.scorelabel.text = "\(scores[indexPath.row].score)"
        
        return cell
    }
    
    //cell の高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


class rankCell: UITableViewCell{
    
    let numberlabel = UILabel()
    
    
    let nameLabel = UILabel()
    
    
    let scorelabel = UILabel()
    
    
    func setCellView(){
        
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(numberlabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(scorelabel)
        
        
        numberlabel.baseFont(font: .monospacedSystemFont(ofSize: 25, weight: .bold))
        nameLabel.baseFont(font: .monospacedSystemFont(ofSize: 25, weight: .bold))
        scorelabel.baseFont(font: .italicSystemFont(ofSize: 25))
        
        
        numberlabel.baseTextColor()
        nameLabel.baseTextColor()
        scorelabel.baseTextColor()
        
        
        numberlabel.baseColor(backgroundColor: .label, opacity: 0.2)
        nameLabel.baseColor(backgroundColor: .systemBackground)
        scorelabel.baseColor(backgroundColor: .systemBackground)
        
        
        numberlabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scorelabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            numberlabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberlabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            numberlabel.widthAnchor.constraint(equalToConstant: 60),
            numberlabel.heightAnchor.constraint(equalToConstant: 60),
            
            
            scorelabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            scorelabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            scorelabel.widthAnchor.constraint(equalToConstant: 100),
            scorelabel.heightAnchor.constraint(equalToConstant: 60),
            
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: numberlabel.rightAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: scorelabel.leftAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}



class Score{
    
    var score: Int
    
    
    var name: String
    
    init(score: Int, name: String) {
        self.score = score
        self.name = name
    }
}

