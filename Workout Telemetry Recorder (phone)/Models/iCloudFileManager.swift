//
//  iCloudFileManager.swift
//  Workout Telemetry Recorder (phone)
//
//  Created by Joshua on 9/23/20.
//

import Foundation

class iCloudFileManager {
    
    var containerURL: URL? {
        return FileManager.default.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents")
    }
    
    func testMakingFile() {
        
        print("Begining test of iCloud file creation.")
        
        // check for container existence
        if let url = containerURL {
            if !FileManager.default.fileExists(atPath: url.path, isDirectory: nil) {
                do {
                    print("Trying to create a directory...")
                    try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                    print("   success")
                }
                catch {
                    print("error creating directory: \(error.localizedDescription)")
                }
                
            }
            
            let documentURL = url
                .appendingPathComponent("watch-telemetry-test")
                .appendingPathExtension("txt")
            do {
                print("Trying to write text to file...")
                try "Here is some text.".write(to: documentURL, atomically: true, encoding: .utf8)
                print("   success")
            } catch {
                print("error writing file: \(error.localizedDescription)")
            }
        } else {
            print("`containerURL` is `nil`.")
        }
    }
}
