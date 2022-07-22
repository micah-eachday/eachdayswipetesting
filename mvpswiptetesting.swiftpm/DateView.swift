//
//  File.swift
//  mvpswiptetesting
//
//  Created by Micah Turpin on 7/7/22.
//

import Foundation
import SwiftUI

// Code for countdown timer, test 1-2
struct DateView: View {
    @State private var date = Date.now
    init() {
        print(date)
    }
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
        }()
    
    var dateStr: String {
        dateFormatter.string(from: self.date)
    }
    
    var timeStr: String {
        timeFormatter.string(from: self.date)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                DatePicker("Please enter a date", selection: $date)
                Text(dateStr)
                Text(timeStr)
            }
        }
    }
}
