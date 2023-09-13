//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct AddHabit: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    
    @State private var habit = ""
    @State private var description = ""
    @State private var numberOfTimes = 1
    @State private var frequencyOfrepetations = "Day"
    
    let frequencies = [
        "Day",
        "Alternate day",
        "Week",
        "Fortnight",
        "Month",
        "Quarter",
        "Year"
    ]

    var body: some View {
        NavigationView {
            Form {
                TextField("Enter habit", text: $habit)
                TextField("Description", text: $description)
                Picker("Number of times", selection: $numberOfTimes) {
                    ForEach(1...20, id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("Every", selection: $frequencyOfrepetations) {
                    ForEach(frequencies, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            .navigationTitle("Add new habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let item = HabitItem(name: habit, description: description, repetationFrequency: numberOfTimes, repetationInterval: frequencyOfrepetations, completionDates: [])
                        habits.items.append(item)
                        dismiss()
                    } label: {
                        Text("Done")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
