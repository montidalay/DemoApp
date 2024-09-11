//
//  Portfolio.swift
//  tabBar
//
//  Created by Sea Ray on 9/9/2567 BE.
//

import SwiftUI

struct Portfolio: View {
    @State private var items: [PortfolioItem] = []

    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text("แผนการลงทุนของคุณ")
                    .font(.system(size: 20))
                    .padding(.top)
                
                List(items) { item in
                    HStack {
                        // Load image from URL with AsyncImage
                        AsyncImage(url: URL(string: item.image_plan)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
                        }

                        // portfolio details
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.system(size: 14))

                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Point รอลงทุน")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text("Point ลงทุนแล้ว")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }

                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text("\(item.pending_point, specifier: "%.2f")")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                    HStack {
                                        Text("\(item.cost, specifier: "%.2f")")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                        Text("(\(item.change > 0 ? "+" : "")\(item.change, specifier: "%.2f"))")
                                            .font(.caption)
                                            .foregroundColor(item.change > 0 ? .green : (item.change == 0 ? .orange : .red))
                                    }
                                }
                            }
                        }
                        .padding(.leading, 2)
                    }
                    .padding(.vertical, 2)
                }
                .listStyle(PlainListStyle())  // Use PlainListStyle to remove default insets
                .frame(width: geometry.size.width)  // Make List fill the screen width
                .padding(0)
            }
        }
        .onAppear {
            loadPortfolioData()
        }
    }

    // Load data using the PortfolioDataLoader
    private func loadPortfolioData() {
        let dataLoader = PortfolioDataLoader()
        if let loadedItems = dataLoader.loadItems() {
            items = loadedItems
        } else {
            print("No items loaded.")
        }
    }
}

#Preview {
    Portfolio()
}




