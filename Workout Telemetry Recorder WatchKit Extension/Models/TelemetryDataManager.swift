//
//  TelemetryDataManager.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/22/20.
//

import Foundation
import CoreMotion

class TelemetryDataManager: ObservableObject {
    var hardwareData = HardwareData()
    
    var numberOfHardwareDatapoints: Int {
        get {
            hardwareData.pitch.count
        }
    }
    
    func updateHardwareData(data: CMDeviceMotion) {
        let attitude: CMAttitude = data.attitude
        hardwareData.pitch.append(attitude.pitch)
        hardwareData.yaw.append(attitude.yaw)
        hardwareData.roll.append(attitude.roll)
    }
}



class HardwareData {
    var pitch = [Double]()
    var yaw = [Double]()
    var roll = [Double]()
}
