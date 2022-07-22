//
//  File.swift
//  mvpswiptetesting
//
//  Created by Micah Turpin on 7/8/22.
//

import Foundation
import SwiftUI
import Collections
import OrderedCollections

struct TestingLayoutView: View {
    @State var dos: OrderedDictionary = [
        "Wake up on time": "sunrise",
        "Make your bed": "bed.double",
        "Take a shower": "cloud.rain",
        "Brush your teeth": "mouth",
        "Use mouthwash": "mouth"
    ]
    
    @State var snoozedDos: OrderedDictionary = [
        "Test snoozed do": "testtube.2"
    ]
    
    @State var completedDos: OrderedDictionary = [
        "Test completed do": "testtube.2"
    ]
    
    @State var currentProgress: CGFloat = 0.0
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray)
                            .frame(width: 10, height: 300)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.yellow)
                            .frame(width: 10, height: 300*currentProgress)
                    }
                    Button(action: {self.startLoading()}) {
                        Text("T")
                    }
                } // closing brace for VStack
            } // closing brace for HStack
        } // closing brace for Navigationview
    }
    
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                print(self.currentProgress)
                if self.currentProgress >= 1.0 {
                    timer.invalidate()
                }
                self.currentProgress += 0.01
                
            }
        }
    }
    
}
