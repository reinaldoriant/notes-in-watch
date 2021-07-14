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
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save(){
        //dump(notes) // dump the notes array
        
        do{
            //1. convert the notes array to data using jsonencoder
            let data = try JSONEncoder().encode(notes)
            //2 create new url to save the file
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //3. Write the data to the given url
            try data.write(to: url)
        }
        catch{
            print("Saving data has failed!")
        }
    }
    
    func load(){
        DispatchQueue.main.async {
            do{
                //1. get the notes URL Path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                //2. create a new property for the data
                let data = try Data(contentsOf: url)
                //3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            }
            catch{
                //Do Nothing
            }
        }
    }
    
    func delete(offsets: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
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
            
            if notes.count>=1 {
                List{
                    ForEach(0..<notes.count, id: \.self){i in
                        NavigationLink(
                            destination: DetailView(note: notes[i], count: notes.count, index: i)){
                            HStack{
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(1)
                                    .padding(.leading,5)
                            }
                        }//: Hstack
                    } //:Loop
                    .onDelete(perform:
                        delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
        }//: Vstack
        
        .navigationTitle("Notes")
        .onAppear(perform: {
            load()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

