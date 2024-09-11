//
//  PortfolioViewController.swift
//  tabBar
//
//  Created by Sea Ray on 10/9/2567 BE.
//

import UIKit

class PortfolioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var portfolioItems: [PortfolioItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //load the portfolio items
        let dataLoader = PortfolioDataLoader()
        if let items = dataLoader.loadItems() {
            portfolioItems = items
        }

        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PortfolioCell")
        view.addSubview(tableView)
    }

    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portfolioItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioCell", for: indexPath)
        let item = portfolioItems[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }

}
