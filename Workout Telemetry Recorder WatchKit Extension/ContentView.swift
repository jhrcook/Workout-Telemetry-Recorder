//
//  ContentView.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WorkoutListView().navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
