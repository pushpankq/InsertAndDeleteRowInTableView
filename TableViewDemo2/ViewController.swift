//
//  ViewController.swift
//  TableViewDemo2
//
//  Created by Pushpank Kumar on 10/01/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblList: UITableView!
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To remove extra space
        tblList.tableFooterView = UIView.init(frame: .zero)
        
        // confirm delegates and data sources
        tblList.dataSource = self
        tblList.delegate = self
    }
    
    // Add rows in tableView
    @IBAction func addRows(_ sender: UIButton) {
        
        names.insert("New Name", at: 0)
        tblList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
    }
    
    // Delete rows from TableView
    @objc func deleteRows(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: tblList)
        guard let indexPath = tblList.indexPathForRow(at: point) else {
            
            return
        }
        names.remove(at: indexPath.row)
        tblList.deleteRows(at: [indexPath], with: .left)
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    // how many cell creates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // cell customization 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if let lbl = cell?.contentView.viewWithTag(101) as? UILabel {
            
            lbl.text = names[indexPath.row]
        }
        
        if let btnDelete = cell?.contentView.viewWithTag(102) as? UIButton {
            
            btnDelete.addTarget(self, action: #selector(deleteRows(_ :)), for: .touchUpInside)
        }
        
        return cell!
    }
    
    // height for every cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

