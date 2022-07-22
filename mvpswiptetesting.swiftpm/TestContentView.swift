//
//  File.swift
//  mvpswiptetesting
//
//  Created by Micah Turpin on 7/10/22.
//

import Foundation
import SwiftUI

struct TestContentView: View {
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            TestProgressBar(progress: $progress)
                .frame(width: 345, height: 14.0)
            Button(
                action: {
                    self.progress = CGFloat.random(in: 0...100)
                }
            ) {
                Text("Random Progress")
            }
            .padding()
        }
    }
}
