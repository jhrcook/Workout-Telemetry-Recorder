//
//  PostWorkoutView.swift
//  Workout Telemetry Recorder WatchKit Extension
//
//  Created by Joshua on 9/22/20.
//

import SwiftUI


struct PostWorkoutView: View {
    
    var dataManager: TelemetryDataManager
    
    @State private var iCloudSyncComplete = false

    
    var body: some View {
        ZStack {
            VStack {
                Text("Syncing with iCloud...")
                
                Button(action: {
                    saveAFile()
                    iCloudSyncComplete.toggle()
                }, label: {
                    Text("Save a file!")
                })
            }
            .navigationBarBackButtonHidden(true)
            
            NavigationLink(
                destination: ContentView(),
                isActive: $iCloudSyncComplete) {
                EmptyView()
            }
            .opacity(0)
        }
    }
    
    func saveAFile() {
        print("no can do...")
    }
}

struct PostWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        PostWorkoutView(dataManager: TelemetryDataManager())
    }
}
