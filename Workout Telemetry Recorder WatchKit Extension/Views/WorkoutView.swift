//
//  WorkoutView.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/22/20.
//

import SwiftUI
import CoreMotion


struct WorkoutView: View {
    
    @ObservedObject var workoutManager: WorkoutManager
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State private var pitch: Double = 0
    @State private var yaw: Double = 0
    @State private var roll: Double = 0
    
    var body: some View {
        VStack {
            Text(String(format: "Pitch: %.3f", pitch))
            Text(String(format: "Yaw: %.3f", yaw))
            Text(String(format: "Roll: %.3f", roll))
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            startMotionManagerCollection()
        }
    }
    
    
    func startMotionManagerCollection() {
        self.motionManager.startDeviceMotionUpdates(to: queue) { (data: CMDeviceMotion?, error: Error?) in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else {
                    print("Error in data collection but no error thrown.")
                }
                return
            }
            
            let attitude: CMAttitude = data.attitude
            DispatchQueue.main.async {
                self.pitch = attitude.pitch
                self.yaw = attitude.yaw
                self.roll = attitude.roll
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static let workoutChoices = WorkoutChoices()
    static var previews: some View {
        WorkoutView(workoutManager: WorkoutManager(info: workoutChoices.workouts[0]))
    }
}
