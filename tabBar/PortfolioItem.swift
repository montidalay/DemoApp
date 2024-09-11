//
//  PortfolioItem.swift
//  tabBar
//
//  Created by Sea Ray on 10/9/2567 BE.
//

import Foundation

struct PortfolioItem: Identifiable, Decodable {
    let id = UUID()  
    let title: String
    let image_plan: String
    let withdrawable_point: Double
    let pending_point: Double
    let cost: Double
    let change: Double
}

