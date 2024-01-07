//
//  Date+Extension.swift
//  Moody
//
//  Created by Bobby Pehtrus on 06/01/24.
//

import Foundation

extension Date {
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
            return calendar.component(component, from: self)
    }
    
}
