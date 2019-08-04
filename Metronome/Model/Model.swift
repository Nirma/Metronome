//
//  Model.swift
//  MetroGnome
//
//  Created by Nicholas Maccharoli on 2019/08/04.
//  Copyright © 2019 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI
import Combine

class Metronome: ObservableObject {
    
    var timer: Timer?
    let objectWillChange = PassthroughSubject<Void, Never>()
    private let granularity: Int = 16
    
    private var timeInterval: TimeInterval {
        return 1 / ((Double(beatsPerMinute) / 60.0) * Double(granularity))
    }
    
    func configureTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            self.tick()
        }
    }
    private var current: Int = 0
    
    var quarterBeat: (current: Int, total: Int) {
        (current / 4, 4)
    }
    
    var eigthBeat: (current: Int, total: Int) {
         (current / 2, 8)
    }
    
    var sixteenthBeat: (current: Int, total: Int) {
         (current, 8)
    }
    

    
    // Default is 16th notes
    func tick() {
        current += 1
        if current >= granularity {
            current = 0
        }
        objectWillChange.send()
    }
    
    var beatsPerMinute: Int {
        Int(sliderPercent * 208)
    }
    
    var sliderPercent: Double = 0 {
        didSet {
            configureTimer()
            objectWillChange.send()
        }
    }
}
