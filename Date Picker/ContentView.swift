//
//  ContentView.swift
//  Date Picker
//
//  Created by Daisuke Sakurai on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(DefaultDatePickerStyle())
                .fixedSize()
                .padding()
            Button(action: copyDateToClipboard) {
                Text("Copy Date to Clipboard")
            }.padding()
            
        }
        .padding()
    }
    
    func copyDateToClipboard() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(formattedDate, forType: .string)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
