//
//  ViewController.swift
//  PartyRockAppTableView
//
//  Created by Marlon Raschid Tavarez Parra on 14/10/16.
//  Copyright © 2016 MyBCloud. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var partyRocks = [PartyRock]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://img05.deviantart.net/4c2f/i/2012/059/1/d/party_rock_in_progress_by_lmfaorobot-d4raz0f.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Party Rock Anthem ft. Lauren Bennett, GoonRock")
        let p2 = PartyRock(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqfX1oLMpJX1DBmRsS1okR5ig6Mz9s8fAO7f7iYlkjqd1bLFLg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SkTt9k4Y-a8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Sorry For Party Rocking")
        let p3 = PartyRock(imageURL: "https://yt3.ggpht.com/-LEydX3sr14I/AAAAAAAAAAI/AAAAAAAAAAA/QuP-jdZZWkU/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UA8rcLvS1BY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - Champagne Showers ft. Natalia Kills")
        let p4 = PartyRock(imageURL: "https://pbs.twimg.com/profile_images/694863889851232256/lYJafKNo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/clSv4TzbRCs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LMFAO - La La La")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        }
        else {
            
          return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
            
        }
        
    }

}

