//
//  PortfolioDataLoader.swift
//  tabBar
//
//  Created by Sea Ray on 10/9/2567 BE.
//

import Foundation

class PortfolioDataLoader {
    func loadItems() -> [PortfolioItem]? {
        guard let url = Bundle.main.url(forResource: "portfolio", withExtension: "json") else {
            print("Failed to find portfolio.json in the bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let items = try decoder.decode([PortfolioItem].self, from: data)
            return items
        } catch {
            print("Failed to load or decode portfolio.json: \(error)")
            return nil
        }
    }
}

