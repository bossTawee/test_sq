//
//  ViewController.swift
//  demo_foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 21/11/2562 BE.
//  Copyright © 2562 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var dataPlace: [itemData] = [itemData]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    func loadingData() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMDD"
        let result = formatter.string(from: date)
        let client_id = "DSSIAPPQ4LSR40XNXZXJQNHGU0NSNFC5YEJYKIHJTSY0QX2E"
        let client_secret = "PL3ICK2DMR4OXDQ1T5ODZ4R255SA00B3TDUQRJUK4ICZL5CX"
        let jsonUrl = "https://api.foursquare.com/v2/venues/explore?near=cnx&client_id=\(client_id)&client_secret=\(client_secret)&v=\(result)"
        guard let url = URL(string: jsonUrl) else {return}
          
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let jsonData = data else {return}
              do {
                let jsonRes = try JSONDecoder().decode(responseInfo.self, from: jsonData)
                self.dataPlace = jsonRes.response.groups[0].items

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
              } catch  {
                  print("err")
              }
              
          }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlaceTableViewCell
        cell.initCell(item: self.dataPlace[indexPath.row].venue)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

