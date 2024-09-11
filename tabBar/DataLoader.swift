//
//  DataLoader.swift
//  tabBar
//
//  Created by Sea Ray on 9/9/2567 BE.
//



import Foundation

class DataLoader {
    func loadItems() -> [IndexItem]? {
        guard let url = Bundle.main.url(forResource: "Indice", withExtension: "json") else {
            print("Failed to find Indice.json in the bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let items = try decoder.decode([IndexItem].self, from: data)
            return items
        } catch {
            print("Failed to load or decode Indice.json: \(error)")
            return nil
        }
    }
}

