//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct HabitDetail: View {
    @ObservedObject var habits: Habits
    let habit: HabitItem
    var body: some View {
        List {
            Section("Description") {
                Text(habit.description)
            }
            Section("Tracking") {
                ForEach(habit.completionDates, id: \.self) {
                    Text($0.formatted(date: .abbreviated, time: .standard))
                }
            }
        }
        .navigationTitle(habit.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button {
                        let updatedHabit = HabitItem(id: habit.id, name: habit.name, description: habit.description, repetationFrequency: habit.repetationFrequency, repetationInterval: habit.repetationInterval, completionDates: habit.completionDates + [Date.now])
                        if let habitIndex = habits.items.firstIndex(where: { habitItem in
                            return habitItem.id == habit.id
                        }) {
                            habits.items.remove(at: habitIndex)
                            habits.items.insert(updatedHabit, at: habitIndex)
                        }
                    } label: {
                        Text("Add")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static let habits = Habits()
    static let habit = HabitItem(name: "Fourth Habit", description: "This si the first habit", repetationFrequency: 4, repetationInterval: "Week", completionDates: [])
    static var previews: some View {
        HabitDetail(habits: Habits(), habit: habit)
    }
}
