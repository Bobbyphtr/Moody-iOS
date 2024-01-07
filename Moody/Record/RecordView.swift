//
//  RecordView.swift
//  Moody
//
//  Created by Bobby Pehtrus on 07/01/24.
//

import SwiftUI

private let placeholderNoteValue: String = "Add short note here"
private let placeholderTextColor: Color = .gray

struct RecordView: View {
    
    @State var sliderValue: Double = 0
    // Focus state nor working on previews
    @FocusState private var sliderValueResponder: Bool
    
    // Short note field
    @State var shortNoteTextValue: String = placeholderNoteValue
    @State var shortNoteTextColor: Color = placeholderTextColor
    @FocusState private var shortNoteResponder: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("slider value",
                          value: $sliderValue,
                          format: .number.precision(.fractionLength(0)))
                    .focused($sliderValueResponder)
                    .multilineTextAlignment(.leading)
                    .keyboardType(.numberPad)
                    .frame(width: 48)
            }
            Slider(value: $sliderValue, in: -100...100) {
                Text("Label")
            } minimumValueLabel: {
                Text("Bad")
            } maximumValueLabel: {
                Text("Happy")
            } onEditingChanged: { isEditing in
                sliderValueResponder = false
            }
            TextEditor(text: $shortNoteTextValue)
                .focused($shortNoteResponder)
                .foregroundColor(shortNoteTextValue == placeholderNoteValue ? placeholderTextColor : .black)
                .frame(height: 64.0)
                .onChange(of: shortNoteResponder) { isFocused in
                    print("isFocused \(isFocused)")
                    switch isFocused {
                    case true:
                        if shortNoteTextValue == placeholderNoteValue {
                            shortNoteTextValue = ""
                        }
                    case false:
                        if shortNoteTextValue == "" {
                            shortNoteTextValue = placeholderNoteValue
                        }
                    }
                }
                
            Button("Submit Mood") {
            
            }
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
