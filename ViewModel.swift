//
//  ViewModel.swift
//  TrackDowloadProgress
//
//  Created by Роман Горностаев on 06.10.2023.
//

import UIKit

class ViewModel: NSObject, ObservableObject {
        
    @Published var image: UIImage = UIImage()
    @Published var bytesExpectedToWrite: Int64 = 0
    @Published var totalBytesWritten: Int64 = 0
   
    func downloadPicture() {
        guard let url = URL(string: "https://picsum.photos/2000") else { return }
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .none)

        session.downloadTask(with: url).resume()
    }
    
}

extension ViewModel: URLSessionDelegate, URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // Downloaded in KB
        DispatchQueue.main.async { self.totalBytesWritten = totalBytesWritten }
        let written = totalBytesWritten.formatToString()
        
        // Total size in KB
        DispatchQueue.main.async { self.bytesExpectedToWrite = totalBytesExpectedToWrite }
        let expected = totalBytesExpectedToWrite.formatToString()
        
        // Total progress
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        // Print on console
        print("Downloaded \(written) / \(expected)")
        print("Progress: \(progress * 100)%")
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let data = try? Data(contentsOf: location), let image = UIImage(data:data) {
            DispatchQueue.main.async { self.image = image }
        } else {
            fatalError("Cannot load the image")
        }
    }
    
}
