//
//  PartyCell.swift
//  PartyRockAppTableView
//
//  Created by Marlon Raschid Tavarez Parra on 15/10/16.
//  Copyright © 2016 MyBCloud. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            
            do {
                
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    
                    self.videoPreviewImage.image = UIImage(data: data)
                    
                }
                
            }
            catch{
                
                
            }
            
        }
        
        
    }

}
