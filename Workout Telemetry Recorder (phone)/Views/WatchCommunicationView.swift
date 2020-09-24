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
    
    let icloudFileManager = iCloudFileManager()
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("System information")
                    .font(.title)
                Text("watch connection: \(watchConnectionStatus)")
                    .font(.body)
                Text("status: \(statusMessage)")
                    .font(.body)
            }
            
            Spacer()
            
            Button(action: {
                icloudFileManager.testMakingFile()
            }) {
                HStack {
                    Image(systemName: "arrow.up.doc")
                    Text("Upload file to iCloud")
                }
            }
            
            Spacer()
        }
    }
}

struct WatchCommunicationView_Previews: PreviewProvider {
    static var previews: some View {
        WatchCommunicationView()
    }
}
