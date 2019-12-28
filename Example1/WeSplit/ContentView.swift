//
//  ContentView.swift - contains initial UI for program
//  WeSplit
//
//  Created by Evan Tilley on 12/27/19.
//  Copyright © 2019 Evan Tilley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Picker("Select your student", selection: $selectedStudent){
            ForEach(0 ..< students.count){ student in
                Text(self.students[student])
            }
        }
    }
}

//this piece of code is for you to look at preview on canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
