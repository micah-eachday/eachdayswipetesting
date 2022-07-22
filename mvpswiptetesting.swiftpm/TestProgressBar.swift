//
//  File.swift
//  mvpswiptetesting
//
//  Created by Micah Turpin on 7/10/22.
//

import Foundation
import SwiftUI
import Collections
import OrderedCollections

struct TestProgressBar: View {
    @Binding var progress: CGFloat
    @State var isShowing = false
    
    @State var exampleList: OrderedDictionary = [
        "Key 1": "value 1",
        "Key 2": "value 2",
        "Key 3": "value 3",
        "Key 4": "value 4",
        "Key 5": "value 5",
        "Key 6": "value 6",
    ]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                List {
                    Section {
                        ForEach(exampleList.keys, id: \.self) {
                            example in
                            Label("\(example) >>> \(exampleList[example] ?? "")", systemImage: "testtube.2")
                            let _ = print("Example \'\(example)\'")
                        }
                    }
                }
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .opacity(0.3)
                        .frame(width: geometry.size.width / 10, height: geometry.size.height)
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: geometry.size.width / 10, height: self.isShowing ? geometry.size.width * (self.progress / 100.0) : 0.0)
                        .animation(.linear(duration: 0.4), value: progress)
                }
            }
            .onAppear {
                self.isShowing = true
            }
            .cornerRadius(geometry.size.height / 2.0)
        }
    }
}
