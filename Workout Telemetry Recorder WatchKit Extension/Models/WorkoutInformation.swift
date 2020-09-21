//
//  WorkoutInformation.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/21/20.
//

import Foundation

struct WorkoutInformation: Identifiable {
    let id: Int
    let name: String
    let type: ExerciseType
    var duration: Int
}

