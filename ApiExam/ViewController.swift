//
//  ViewController.swift
//  ApiExam
//
//  Created by ABC on 25/03/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

   
    @IBOutlet var tableView: UITableView!
    var arrData: [Details] = []
    var arrImage: [String] = ["ab", "ab", "ab", "ab","ab", "ab", "ab", "ab", "ab", "ab"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiCall()
        tableViewRegistraNibFile()
       
        
    }

    
   
      
        
    func getApiCall() {
        AF.request("https://cataas.com/api/cats?tags=cute", method: .get).responseData {  response in
            debugPrint("Response: \(response)")
            
            guard let apiData = response.data else { return }
            
            do {
                let details = try JSONDecoder().decode([Details].self, from: apiData)
                print(details)
                self.arrData = details
                self.tableView.reloadData()
                
                
               
            } catch {
                print("parsing error")
                
                
            }
        }
    }
    
    
    private func tableViewRegistraNibFile() {
        tableView.register(UINib(nibName: "ApiTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

}


struct Details: Decodable {
    
    
    var tags: [String]
   
    
    private enum CodingKeys: String, CodingKey {
       
        case tags
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ApiTableViewCell
      cell.images?.image = UIImage(named: arrImage[indexPath.row])
        cell.tagsLabel?.numberOfLines = 0
        let data = "#\(arrData[indexPath.row])"
        cell.tagsLabel.text = "\(arrData.map{ $0.tags } ))"
       
       
        
        
        return cell
    }
    
    
    
}
