//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Rishi Singh on 13/09/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let repetationFrequency: Int
    let repetationInterval: String
    let completionDates: [Date]
    
    var habitRepetation: String {
      let formattedRepetitions = repetationInterval.lowercased();

      switch (formattedRepetitions) {
        case "day":
          return repetationFrequency == 1 ? "Once a Day" : "Twice a Day";
        case "alternate day":
          return repetationFrequency == 1 ? "Once every other Day" : "Twice every other Day";
        case "week":
          return repetationFrequency == 1 ? "Once a Week" : "\(string(from: repetationFrequency)) times a Week";
        case "fortnight":
          return repetationFrequency == 1 ? "Once a Fortnight" : "\(string(from: repetationFrequency)) times a Fortnight";
        case "month":
          return repetationFrequency == 1 ? "Once a Month" : "\(string(from: repetationFrequency)) times a Month";
        case "quarter":
          return repetationFrequency == 1 ? "Once a Quarter" : "\(string(from: repetationFrequency)) times a Quarter";
        case "year":
          return repetationFrequency == 1 ? "Once a Year" : "\(string(from: repetationFrequency)) times a Year";
        default:    
          return "N/A"
      }
    }
    
    func string(from integer: Int) -> String {
      let numbersToWords = [
        "ones",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen",
        "twenty",
      ];

        return numbersToWords[integer - 1].capitalized(with: Locale.current);
    }
}
