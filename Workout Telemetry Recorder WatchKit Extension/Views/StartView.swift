//
//  StartView.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/21/20.
//

import SwiftUI

struct StartView: View {
    
    @ObservedObject var workoutManager: WorkoutManager
    @State var timeRemaining = 3
    var timer = Timer.publish(every: 1, on: .main, in: .common)
    @State private var startWorkout = false
    
    var body: some View {
        ZStack {
            if (startWorkout) {
                Text("\(timeRemaining)")
                    .font(.title)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                    }
            } else {
                Button(action: {
                    startTimer()
                    self.startWorkout.toggle()
                }, label: {
                    Text("Start")
                        .font(.title)
                        .padding()
                })
            }
        }
    }
    
    func startTimer() {
        self.timeRemaining = 3
        let _ = self.timer.connect()
    }
}

struct StartView_Previews: PreviewProvider {
    
    static let workoutChoices = WorkoutChoices()
    
    static var previews: some View {
        StartView(workoutManager: WorkoutManager(info: workoutChoices.workouts[0]))
    }
}
