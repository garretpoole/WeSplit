//
//  ContentView.swift
//  WeSplit
//
//  Created by Garret Poole on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var student = "Harry"
    
    var body: some View {
        NavigationView{
            Form{
                Picker("Select your student", selection:
                    $student) {
                    ForEach(students, id: \.self){
                        Text($0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
