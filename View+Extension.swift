//
//  View++.swift
//  TrackDowloadProgress
//
//  Created by Роман Горностаев on 08.10.2023.
//

import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
