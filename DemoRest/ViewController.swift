//
//  ViewController.swift
//  DemoRest
//
//  Created by mobapp04 on 29/01/2019.
//  Copyright © 2019 mobapp04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var items = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = PostParser.getAllPosts()
        
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //constante voor cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        //cell opvullen met userpost
        let userPostForCell = items[indexPath.row]
        
        cell.textLabel!.text = userPostForCell.title
        
        return cell
    }
    
    
}
