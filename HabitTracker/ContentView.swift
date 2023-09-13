//
//  ContentView.swift
//  HabitTracker
//
//  Created by Rishi Singh on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var searchtext = ""
    @State private var showingAddHabitSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { habit in
                    NavigationLink {
                        HabitDetail(habits: habits, habit: habit)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(habit.name)")
                                    .font(.headline)
                                Text("\(habit.habitRepetation)")
                            }
                            Spacer()
                            Text("\(habit.completionDates.count)")
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Habit Tracker")
            .searchable(text: $searchtext)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            showingAddHabitSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("New Habit")
                                    .font(.headline.bold())
                            }
                        }
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $showingAddHabitSheet) {
                AddHabit(habits: habits)
            }
        }
    }
    
    func delete(at indexSet: IndexSet) {
        habits.items.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
