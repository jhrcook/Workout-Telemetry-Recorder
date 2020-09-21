//
//  WorkoutManager.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/21/20.
//

import Foundation

class WorkoutManager: NSObject, ObservableObject {
    var info: WorkoutInformation
    
    init(info: WorkoutInformation) {
        self.info = info
    }
}
