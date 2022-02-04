//
//  ContentView.swift
//  WeSplit
//
//  Created by Garret Poole on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    //allows data to be stored seperate from the View struct
    //for simple properties stored locally in one view
    @State private var tapCount = 0
    var body: some View {
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
