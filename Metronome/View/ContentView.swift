//
//  ContentView.swift
//  MetroGnome
//
//  Created by Nicholas Maccharoli on 2019/08/04.
//  Copyright © 2019 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var metro: Metronome = Metronome()
    
    var body: some View {
        VStack {
            Spacer()
            Text("MetroGnome")
                .font(.title)
            Spacer()
            Text("\(metro.beatsPerMinute) BPM")
            Slider(value: $metro.sliderPercent)
            BeatView(currentBeat: metro.quarterBeat.current, totalBeats: 4)
            BeatView(currentBeat: metro.eigthBeat.current, totalBeats: 8)
            BeatView(currentBeat: metro.sixteenthBeat.current, totalBeats: 16)
            Spacer()
            
        }
        .onAppear(perform: setup)
    }
    
    func setup() {
        let mop = Subscribers.Sink<(), Never>(receiveCompletion: {_ in }, receiveValue: {
            print("Current Value: \(self.metro.beatsPerMinute)")
        })
        
        metro.objectWillChange.subscribe(mop)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
