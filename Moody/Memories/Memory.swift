//
//  Memory.swift
//  Moody
//
//  Created by Bobby Pehtrus on 03/01/24.
//

import Foundation

enum Mood {
    case sad
    case happy
    case angry
    case neutral
    
    var description: String {
        switch self {
        case .sad:
            return "Sad"
        case .happy:
            return "Happy"
        case .angry:
            return "Angry"
        case .neutral:
            return "Neutral"
        }
    }
    
    var emoji: String {
        switch self {
        case .sad:
            return "😢"
        case .happy:
            return "😄"
        case .angry:
            return "😡"
        case .neutral:
            return "😐"
        }
    }
}

struct Memory: Identifiable {
    
    typealias MoodPointsHistory = (Int, Date)
    typealias MoodHistory = (Mood, Date)
    
    var id: UUID = UUID()
    
    /// Date registered
    let date: Date
    
    var moments: [Moment] = []
    
    init(date: Date, moments: [Moment] ) {
        self.date = date
        self.moments = moments
    }

    mutating func addMoment(_ moment: Moment) {
        moments.append(moment)
    }
    
}

struct Moment: Identifiable {
    
    var id: UUID = UUID()
    let date: Date = Date()
    let mood: Mood
    let point: Int
    
}
