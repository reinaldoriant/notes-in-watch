//
//  Note.swift
//  NotesWatch WatchKit Extension
//
//  Created by TI Digital on 14/07/21.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
