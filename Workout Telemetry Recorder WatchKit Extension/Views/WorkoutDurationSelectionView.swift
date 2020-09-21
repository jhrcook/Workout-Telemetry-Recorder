//
//  WorkoutDurationSelectionView.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/21/20.
//

import SwiftUI

struct WorkoutDurationSelectionView: View {
    
    init(workoutInformation: WorkoutInformation) {
        self.workoutManager = WorkoutManager(info: workoutInformation)
    }
    
    @ObservedObject var workoutManager: WorkoutManager
    @State private var selectedDuration: Int = 0
    @State private var startWorkout = false
    
    var body: some View {
        ZStack {
            
            NavigationLink(
                destination: StartView(workoutManager: self.workoutManager),
                isActive: $startWorkout) {
                EmptyView()
            }.hidden()
            
            
            VStack {
                
                Picker("Workout duration", selection: $selectedDuration) {
                    ForEach(0..<121) { i in
                        Text("\(i)")
                    }
                }
                
                Button(action: {
                    self.workoutManager.info.duration = selectedDuration
                    self.startWorkout.toggle()
                }, label: {
                    Text("OK")
                })
            }
            .onAppear {
                self.selectedDuration = workoutManager.info.duration
        }
        }
    }
}

struct WorkoutDurationSelectionView_Previews: PreviewProvider {
    
    static let workoutChoices = WorkoutChoices()
    
    static var previews: some View {
        WorkoutDurationSelectionView(workoutInformation: workoutChoices.workouts[0])
    }
}
