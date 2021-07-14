//
//  CreditsView.swift
//  NotesWatch WatchKit Extension
//
//  Created by TI Digital on 14/07/21.
//

import SwiftUI

struct CreditsView: View {
    //MARK : - Property
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    // MARK : - Body
    var body: some View {
        VStack (spacing: 3){
           //Profile image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            //header
            HeaderView(title: "Credits")
            //content
            Text("Reinaldo Riant")
                .foregroundColor(.primary)
                .fontWeight(.bold)
        
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
