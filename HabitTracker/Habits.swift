//
//  Habits.swift
//  HabitTracker
//
//  Created by Rishi Singh on 13/09/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]() {
        didSet {
            if let data = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(data, forKey: "habitItems")
            }
        }
    }
    
    @Published var total = 0.0
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let savedItems = UserDefaults.standard.data(forKey: "habitItems") {
            let decoder = JSONDecoder()
            if let decodedItems = try? decoder.decode([HabitItem].self, from: savedItems) {
                items = decodedItems
//                for item in items {
//                    total += item.amount
//                }
                return
            }
        }
        
        items = []
    }
}
