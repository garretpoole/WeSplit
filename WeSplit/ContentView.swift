//
//  ContentView.swift
//  WeSplit
//
//  Created by Garret Poole on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    //numPeople sets index row in the picker (2 -> 4 people)
    @State private var numPeople = 2
    @State private var tipPercent = 20
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    //computed property
    var totalPerPerson: Double{
        //calculate total per person
        let peopleCount = Double(numPeople + 2)
        let tipSelection = Double(tipPercent)
        
        let tipVal = checkAmount * tipSelection/100
        let grandTotal = checkAmount + tipVal
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format:
                        //Locale is struct that gets area of user from iOS settings
                        .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip Percentage", selection: $tipPercent) {
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Leave a tip")
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total Per Person")
                }
                .navigationTitle("WeSplit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
