//
//  Square.swift
//  MetroGnome
//
//  Created by Nicholas Maccharoli on 2019/08/04.
//  Copyright © 2019 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI


struct BeatView: View {
    let currentBeat: Int
    let totalBeats: Int
     var body: some View {
         HStack {
            ForEach(0...(totalBeats - 1), id: \.self) { beat in
                Circle().foregroundColor(beat == self.currentBeat ? .pink : .green)
             }
         }
     }
}

#if DEBUG
struct BeatView_Previews: PreviewProvider {
    static var previews: some View {
        BeatView(currentBeat: 3, totalBeats: 4)
    }
}
#endif
