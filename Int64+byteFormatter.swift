//
//  Int64+byteFormatter.swift
//  TrackDowloadProgress
//
//  Created by Роман Горностаев on 08.10.2023.
//

import Foundation

extension Int64 {
    
    func formatToString() -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        return formatter.string(fromByteCount: self)
    }
    
}
