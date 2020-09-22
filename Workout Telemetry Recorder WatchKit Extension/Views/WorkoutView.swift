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
    var dataManager = TelemetryDataManager()
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State var amountOfDataCollected: Int = 0
    
    @State private var workoutComplete = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Button(action: {
                    stopMotionManagerCollection()
                    workoutComplete.toggle()
                }) {
                    Text("Done")
                }
                
                Spacer()
                Text("Num. data points: \(amountOfDataCollected)")
                    .font(.footnote)
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                startMotionManagerCollection()
            }
            
            NavigationLink(
                destination: PostWorkoutView(dataManager: dataManager),
                isActive: $workoutComplete) {
                EmptyView()
            }
            .opacity(0)
        }
    }
}



extension WorkoutView {
    func startMotionManagerCollection() {
        motionManager.startDeviceMotionUpdates(to: queue) { (data: CMDeviceMotion?, error: Error?) in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else {
                    print("Error in data collection but no error thrown.")
                }
                return
            }
            
            dataManager.updateHardwareData(data: data)
            DispatchQueue.main.async {
                amountOfDataCollected = dataManager.numberOfHardwareDatapoints
            }
        }
    }
    
    
    func stopMotionManagerCollection() {
        motionManager.stopDeviceMotionUpdates()
    }
}



struct WorkoutView_Previews: PreviewProvider {
    static let workoutChoices = WorkoutChoices()
    static var previews: some View {
        WorkoutView(workoutManager: WorkoutManager(info: workoutChoices.workouts[0]))
    }
}
