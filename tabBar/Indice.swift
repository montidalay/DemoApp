//
//  Indice.swift
//  tabBar
//
//  Created by Sea Ray on 9/9/2567 BE.
//

import SwiftUI

struct Indice: View {
    @State private var items: [IndexItem] = []
    @State private var lastUpdate: String = ""

    let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]

    var body: some View {
        ScrollView {
            
            VStack(spacing: 0){
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 50)
                        
                        Text("Indices")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 35)
                        
                        Text("Last Update \(lastUpdate)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)  
                    }
                }
                
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(items, id: \.name) { item in
                            VStack(alignment: .center, spacing: 10) {
                                HStack(){
                                    Text(item.change)
                                        .font(.system(size:11))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                  
                                    Spacer()
                                    
                                    Text(item.percentChange)
                                        .font(.system(size:11))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                }
                                
                                Text(item.name)
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                
                                Text(item.value)
                                    .font(.system(size:15))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(item.backgroundColor)
                            .cornerRadius(0)
                        }
                }}
            .padding(.horizontal, 0)
            .padding(.vertical, 0)
        }
        .onAppear {
            loadItems()
            updateLastUpdate()
        }
    }

    private func loadItems() {
        let dataLoader = DataLoader()
        if let loadedItems = dataLoader.loadItems() {
            items = loadedItems
        } else {
            print("No items loaded.")
        }
    }
    private func updateLastUpdate() {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd MMM yyyy HH:mm:ss"
            lastUpdate = formatter.string(from: Date())
        }

    
    
    
}

#Preview {
    Indice()
}

