//
//  ViewController.swift
//  tabBar
//
//  Created by Sea Ray on 9/9/2567 BE.
//
import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarItem.appearance()
                let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
                appearance.setTitleTextAttributes(attributes, for: .normal)


        // TabView
        let tabView = TabView {
            Indice()
                .tabItem {
                    Text("Indices")
                        
                    
                }
            Portfolio()
                .tabItem {
                    Text("Portfolio")
                        
                }
        }
        .accentColor(.blue)

        // Create a UIHostingController with the SwiftUI TabView
        let hostingController = UIHostingController(rootView: tabView)

        // Add the UIHostingController as a child view controller
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
struct PortfolioWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PortfolioViewController {
        return PortfolioViewController()
    }

    func updateUIViewController(_ uiViewController: PortfolioViewController, context: Context) {}
}


