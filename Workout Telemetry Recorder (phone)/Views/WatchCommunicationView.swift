//
//  WatchCommunicationView.swift
//  Workout Telemetry Recorder (phone)
//
//  Created by Joshua on 9/23/20.
//

import SwiftUI

struct WatchCommunicationView: View {
    
    @State private var watchConnectionStatus = "Watch not connected"
    @State private var statusMessage = "Idle"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("watch connection: \(watchConnectionStatus)")
                .font(.body)
            Text("status: \(statusMessage)")
                .font(.body)
        }
    }
}

struct WatchCommunicationView_Previews: PreviewProvider {
    static var previews: some View {
        WatchCommunicationView()
    }
}
