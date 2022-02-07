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
    @State private var tipPercent = 15
    @FocusState private var amountFocused: Bool
    
    //computed property
    var grandTotal: Double{
        let tipSelection = Double(tipPercent)
        let tipVal = checkAmount * tipSelection/100
        
        return checkAmount + tipVal
    }
    var totalPerPerson: Double{
        //calculate total per person
        let peopleCount = Double(numPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    // new property with a special type; want it to work with Doubles.
    var dollarFormat: FloatingPointFormatStyle<Double>.Currency{
        //Locale is struct that gets area of user from iOS settings
        let currencyCode = Locale.current.currencyCode ?? "USD"
        return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: dollarFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountFocused)
                    Picker("Number of People", selection: $numPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip Percentage", selection: $tipPercent) {
                        ForEach(0..<101){
                            Text("\($0)%")
                        }
                    }
                } header: {
                    Text("Leave a tip")
                }
                Section{
                    Text(grandTotal, format: dollarFormat)
                } header: {
                    Text("Total")
                }
                Section{
                    Text(totalPerPerson, format: dollarFormat)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            //lets specify toolbar items for a group
            .toolbar {
                //blace buttons for toolbar
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done") {
                        amountFocused = false
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
