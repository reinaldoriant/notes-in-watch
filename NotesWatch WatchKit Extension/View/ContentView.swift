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
    
    func save(){
        dump(notes) // dump the notes array
    }
    
    // MARK : - Body
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6){
                TextField("Add New Note", text: $text)
                
                Button{
                    //1. only run the button's action when the text field is not empty
                    guard text.isEmpty == false else{return}
                    //2. crate a not item and initialize
                    let note = Note(id: UUID(), text: text)
                    //3. add the note to note array
                    notes.append(note)
                    //4. make the text field empty
                    text = ""
                    //5. save the note
                    save()
                    
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
            
            Text("\(notes.count)")
        }//: Vstack
        
        .navigationTitle("Notes")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

