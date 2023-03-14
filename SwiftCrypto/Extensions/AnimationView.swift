//
//  AnimationView.swift
//  SwiftCrypto
//
//  Created by Hakan Gül on 13.03.2023.
//

import SwiftUI

extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
