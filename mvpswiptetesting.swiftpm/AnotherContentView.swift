//
//  File.swift
//  mvpswiptetesting
//
//  Created by Micah Turpin on 7/20/22.
//

import Foundation
import SwiftUI
import OrderedCollections
import OrderedCollections

extension Color {
    static let BodyLightGreen = Color("BodyLightGreen")
    static let EnvironmentPurple = Color("EnvironmentPurple")
    static let MindHotPink = Color("MindHotPink")
    static let RelationshipsOrange = Color("RelationshipOrange")
    static let SnoozedLightPurple = Color("SnoozedLightPurple")
    static let DoCardGray = Color("DoCardGray")
    static let SymbolBackgroundGray = Color("SymbolBackgroundGray")
    static let BlackBackground = Color("SymbolBackgroundGray")
    static let GreenBackground = Color("GreenBackground")
    static let RedBackground = Color("RedBackground")
    static let StreakTextOrange = Color("StreakTextOrange")
}

struct xpCounter {
    static var xpInfo: [Int] = [1, 0, 0]
}

struct doInfo {
    static var originalDoList = ["Wake up on time", "Make your bed", "Shower", "Brush your teeth", "Use mouthwash"]
    static var doColors = ["Wake up on time": "BodyLightGreen",
                    "Make your bed": "EnvironmentPurple",
                    "Shower": "BodyLightGreen",
                    "Brush your teeth": "BodyLightGreen",
                    "Use mouthwash": "BodyLightGreen"]
    static var doDescriptions: [String: String] = ["Wake up on time": "Starting the day makes a difference, oversleeping makes you feel groggy",
                                            "Make your bed": "Declutter your sleeping space to gain mental clarity all day long",
                                            "Shower": "Wash the night away. Make sure to clean your pits, privates, and pimples",
                                            "Brush your teeth": "Get rid of plaque that can lead to diseases like gingivitis. . .oh no!",
                                            "Use mouthwash": "It will help drown out that stanky morning breath that people hate",
                                                   "Nothing to do": "Good job!",
                                                   "Another do": "Wordzzzz"]
    static var doStreaks: [String: Int] = ["Wake up on time": 0,
                                              "Make your bed": 0,
                                              "Shower": 0,
                                              "Brush your teeth": 0,
                                              "Use mouthwash": 0]
    static var dosDone: [String: Bool] = ["Wake up on time": false,
                                         "Make your bed": false,
                                         "Shower": false,
                                         "Brush your teeth": false,
                                         "Use mouthwash": false]
    static var isActive: [String: Bool] = ["Wake up on time": false,
                                         "Make your bed": false,
                                         "Shower": false,
                                         "Brush your teeth": false,
                                         "Use mouthwash": false]
    static var doTodos: OrderedDictionary<String, String> = ["Wake up on time": "Starting the day makes a difference, oversleeping makes you feel groggy",
                                                             "Make your bed": "Declutter your sleeping space to gain mental clarity all day long",
                                                             "Shower": "Wash the night away. Make sure to clean your pits, privates, and pimples",
                                                             "Brush your teeth": "Get rid of plaque that can lead to diseases like gingivitis. . .oh no!",
                                                             "Use mouthwash": "It will help drown out that stanky morning breath that people hate",]
    static var snoozedDos: OrderedDictionary<String, String> = ["Nothing snoozed": "No snoozed dos"]
    static var completedDos: OrderedDictionary<String, String> = ["Nothing completed": "Get cracking!"]
    
}

struct count {
    @State var doCount: Int = doInfo.originalDoList.count
}

struct AnotherContentView: View {
    @State var originalList = doInfo.originalDoList
    
    @State var dos = doInfo()
    @State var doCount: Int = doInfo.originalDoList.count
    
    @State var currentProgress: CGFloat = 0.0
    
    @State private var date = Date.now
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    } ()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    } ()
    
    var dateStr: String {
        dateFormatter.string(from: self.date)
    }
    
    var timeStr: String {
        timeFormatter.string(from: self.date)
    }
    
    @State var bgColors = [Color](repeating: Color.BlackBackground, count: count().doCount)
    @State var leadingPadding = [CGFloat](repeating: 25, count: count().doCount)
    @State var trailingPadding = [CGFloat](repeating: 25, count: count().doCount)
    @State var systemImage = [String](repeating: "smile.fill", count: count().doCount)
    @State var iconAlignment = [SwiftUI.Alignment](repeating: .center, count: count().doCount)
    @State var padding = [Edge.Set](repeating: .leading, count: count().doCount)
    @State var isChanging = true
    @State private var offsets = [CGSize](repeating: CGSize.zero, count: count().doCount)
    
    @State var dosForCount = doInfo.doTodos.keys
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.dateStr)
                  .font(Font.custom("SFProDisplay-Semibold", size: 14))
                  .textCase(.uppercase)
                  .foregroundColor(Color(red: 0.82, green: 0.82, blue: 0.82))
                  .frame(minWidth: 127.00, minHeight: 17.00, alignment: .topLeading)
                Text("Today")
                  .font(Font.custom("SFProDisplay-Bold", size: 35))
                  .foregroundColor(Color.white)
                  .frame(minWidth: 96.00, minHeight: 42.00, alignment: .topLeading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            VStack(alignment: .center) {
                ZStack() {
                    Text("\(Image(systemName: "person.fill"))")
                      .font(.system(size: 24))
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color.white)
                      .frame(minWidth: 26.00, minHeight: 27.00, alignment: .center)
                    ZStack(alignment: .bottom) {
                        Circle() // baseline progress bar
                            .stroke(
                                Color.gray,
                                lineWidth: 5
                            )
                        Circle() // snoozed progress bar
                            .trim(from: 0, to: 0.5)
                            .stroke(
                                Color.SnoozedLightPurple,
                                lineWidth: 5
                            )
                            .rotationEffect(.degrees(90))
                        Circle() // completed progress bar
                            .trim(from: 0, to: 0.25)
                            .stroke(
                                Color.EnvironmentPurple,
                                lineWidth: 5
                            )
                            .rotationEffect(.degrees(90))
                        HStack(spacing: 20) {
                            Text("001")
                              .font(.system(size: 10, design: .monospaced))
                              .fontWeight(.semibold)
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color.black)
                              .frame(minWidth: 19.00, minHeight: 12.00, alignment: .center)

                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                          .background(Color(red: 1, green: 0.84, blue: 0).clipShape(RoundedRectangle(cornerRadius:5)))
                          .frame(width: 30.00, height: 14.00)
                    }
                    .frame(maxWidth: 100)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 62.00)
        
        Rectangle() // separator
            .frame(maxWidth: .infinity, maxHeight: 0.30)
            .padding(.top, 20)
          .rotationEffect(.degrees(-0.00))
        
        NavigationView {
            List {
                Section(header:
                    Label {
                        Text("Morning")
                        .font(.title)
                } icon: {
                    Image(systemName: "sun.max.circle.fill")
                        ._colorMonochrome(.yellow)
                        .font(.title)
                        .frame(minWidth: 25.00, minHeight: 25.00, alignment: .bottom)
                }) {
                    HStack {
                        VStack {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: 2, maxHeight: .infinity)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.yellow)
                                    .frame(maxWidth: 2, maxHeight: 1000*currentProgress)
                            }
                            .onAppear(perform: self.startLoading)
                        }
                        // section that contains proper dos
                        VStack (alignment: .leading) {
                            ForEach(doInfo.doTodos.keys, id: \.self) {
                                doName in
                                let index = dosForCount.firstIndex(of: doName)
                                var element = doInfo.doTodos.elements[index!]
                                ZStack{
                                    Button(action: {
                                        if doInfo.dosDone[doName] == false && doInfo.isActive[doName] == true {
                                            self.offsets[index!] = .zero
                                            self.bgColors[index!] = Color.BlackBackground
                                            doInfo.dosDone[doName] = true
                                            doInfo.doStreaks[doName]! += 1
                                            xpCounter.xpInfo[1] += 10
                                            print(xpCounter.xpInfo[1])
                                        } else {
                                            self.offsets[index!] = .zero
                                            self.bgColors[index!] = Color.BlackBackground
                                        }
                                        self.leadingPadding[index!] = 25
                                        self.trailingPadding[index!] = 25
                                    }) {
                                        HStack {
                                            Text("\(Image(systemName: self.systemImage[index!]))")
                                                .padding([.trailing, .leading], 7.5)
                                        }
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, maxHeight: 60, alignment: self.iconAlignment[index!])
                                        .background(bgColors[index!])
                                        .cornerRadius(10)
                                    } // closing brace for button
                                    .padding()
                                    VStack(alignment: .leading) {
                                        let color = Color(doInfo.doColors[doName] ?? "EnvironmentPurple")
                                        HStack {
                                            ZStack {
                                                let doStreak = (doInfo.doStreaks[doName] ?? 0) as Int
                                                let streak = String(format: "%02d", doStreak)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(color)
                                                .frame(width: 50, height: 50)
                                                Text(streak)
                                                  .font(.system(size: 16, design: .monospaced))
                                                  .fontWeight(.bold)
                                                  .multilineTextAlignment(.center)
                                                  .foregroundColor(Color.black)
                                                  .frame(minWidth: 20.00, minHeight: 19.00, alignment: .center)

                                            }
                                            VStack(alignment: .leading) {
                                                Text("\(doName)")
                                                    .font(Font.custom("SFProDisplay-Medium", size: 22))
                                                Label {
                                                    if doInfo.doStreaks[doName] == 0 {
                                                        Text("\(doInfo.doDescriptions[doName] ?? "")")
                                                            .frame(width: 150, alignment: .leading)
                                                            .font(.subheadline)
                                                            .foregroundColor(.gray)
                                                            .lineLimit(1)
                                                            .truncationMode(.tail)
                                                            .padding(.leading, -10)
                                                    } else {
                                                        Text("\(doInfo.doDescriptions[doName] ?? "")")
                                                            .frame(width: 150, alignment: .leading)
                                                            .font(.subheadline)
                                                            .foregroundColor(.StreakTextOrange)
                                                            .lineLimit(1)
                                                            .truncationMode(.tail)
                                                            .padding(.leading, -10)
                                                    }
                                                } icon: {
                                                    if doInfo.doStreaks[doName] == 0 {
                                                        Image(systemName: "info.circle.fill")
                                                        .foregroundColor(.gray)
                                                    } else {
                                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                                                            .mask(Image(systemName: "flame.fill"))
                                                    }
                                                }
                                                .frame(maxHeight: 20)
                                            }
                                            .padding(.leading, 5)
                                        }
                                        .padding()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10).fill(Color.DoCardGray))
                                    .padding([.top, .bottom], 2)
                                    .offset(x: offsets[index!].width)
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                self.offsets[index!] = gesture.translation
                                                doInfo.isActive[doName] = true
                                                if offsets[index!].width > 0 {
                                                    self.bgColors[index!] = Color.GreenBackground
                                                    self.leadingPadding[index!] = 1
                                                    self.trailingPadding[index!] = 25
                                                    self.systemImage[index!] = "checkmark.circle"
                                                    self.iconAlignment[index!] = .leading
                                                    self.padding[index!] = .leading
                                                } else if offsets[index!].width < 0 {
                                                    self.bgColors[index!] = Color.RedBackground
                                                    self.trailingPadding[index!] = 1
                                                    self.leadingPadding[index!] = 25
                                                    self.systemImage[index!] = "zzz"
                                                    self.iconAlignment[index!] = .trailing
                                                    self.padding[index!] = .trailing
                                                }
                                            }
                                            .onEnded { _ in
                                                if self.offsets[index!].width < -100 {
                                                    if element.key == "\(dosForCount[index!])snoozed" {
                                                        self.offsets[index!] = .zero
                                                        self.bgColors[index!] = Color.BlackBackground
                                                    } else {
                                                        doInfo.doTodos[doName] = "\(dosForCount[index!])snoozed"
                                                        self.offsets[index!] = .zero
                                                        self.bgColors[index!] = Color.BlackBackground
                                                    }
                                                    self.leadingPadding[index!] = 25
                                                    self.trailingPadding[index!] = 25
                                                }
                                                else if self.offsets[index!].width > 100 {
                                                    if element.key == "\(dosForCount[index!])completed" {
                                                        self.offsets[index!] = .zero
                                                        self.bgColors[index!] = Color.BlackBackground
                                                    } else {
                                                        element.key = "\(dosForCount[index!])completed"
                                                        self.offsets[index!] = .zero
                                                        self.bgColors[index!] = Color.BlackBackground
                                                    }
                                                    self.leadingPadding[index!] = 25
                                                    self.trailingPadding[index!] = 25
                                                }
                                                else if self.offsets[index!].width < -50 {
                                                    self.offsets[index!].width = -50
                                                }
                                                else if self.offsets[index!].width > 50 {
                                                    self.offsets[index!].width = 50
                                                }
                                                else if (self.offsets[index!].width < 50 && self.offsets[index!].width > 0) || (self.offsets[index!].width > -50 && self.offsets[index!].width < 0){
                                                    self.offsets[index!].width = .zero
                                                    self.leadingPadding[index!] = 25
                                                    self.trailingPadding[index!] = 25
                                                }
                                                doInfo.isActive[doName] = false
                                            }
                                )
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, -10)
                    } // closing brace for HStack
                    .padding(EdgeInsets(top: 1, leading: -3, bottom: 5
                                        , trailing: 0))
                } // closing brace for To Do section
                .listRowBackground(Color.clear)
                .headerProminence(.increased)
                .padding([.leading, .trailing], -10)
            }.frame(maxWidth: .infinity, alignment: .center)
            .background(Color.black)
            .navigationBarHidden(true)
            .padding(.leading, -15)
        } // closing brace for NavigationView
    } // closing brace for body
        
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                if self.currentProgress >= 1.0 {
                    timer.invalidate()
                }
                self.currentProgress += 0.01
                
            }
        }
    }
}

