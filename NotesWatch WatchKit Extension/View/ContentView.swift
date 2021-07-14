//
//  ContentView.swift
//  NotesWatch WatchKit Extension
//
//  Created by TI Digital on 14/07/21.
//

import SwiftUI

struct ContentView: View {
    // MARK : - Property
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    // MARK : - Function
    
    // MARK : - Body
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6){
                TextField("Add New Note", text: $text)
                
                Button{
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
            }//:HSTACK
            Spacer()
        }//: Vstack
        
        .navigationTitle("Notes")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

