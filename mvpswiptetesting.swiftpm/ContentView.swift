import SwiftUI
import Collections
import OrderedCollections
import Foundation

/*
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
}

struct CenterAlignedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

struct ContentView: View {
    let originalDosForInit: [String] = ["Wake up on time", "Make your bed", "Shower", "Brush your teeth", "Use mouthwash"]
    
    let originalCount: Int
    
    init(originalDosForInit: [String], originalCount: Int) {
        self.originalCount = originalDosForInit.count
    }
    
    @State var originalDos : [String]
    
    @State var dos: OrderedDictionary = [
        "Wake up on time": "BodyLightGreen",
        "Make your bed": "EnvironmentPurple",
        "Shower": "BodyLightGreen",
        "Brush your teeth": "BodyLightGreen",
        "Use mouthwash": "BodyLightGreen"
    ]
    
    static let doDescriptions:[String:String] = [
        "Wake up on time": "Starting the day makes a difference, oversleeping makes you feel groggy",
        "Make your bed": "Declutter your sleeping space to gain mental clairty all day kong",
        "Shower": "Wash the night away. Make sure to clean your pits, privates, and pimples",
        "Brush your teeth": "Get rid of plaque that can lead to diseases like gingivitis. . .oh no!",
        "Use mouthwash": "It will help drown out that stanky morning break that people hate"
    ]
    
    @State var doStreaks:[String:Int] = [
        "Wake up on time": 0,
        "Make your bed": 0,
        "Shower": 0,
        "Brush your teeth": 0,
        "Use mouthwash": 0
    ]
    
    @State var snoozedDos: OrderedDictionary = [
        "Test snoozed do": "testtube.2"
    ]
    
    @State var completedDos: OrderedDictionary = [
        "Test completed do": "testtube.2"
    ]
    
    @State var currentProgress: CGFloat = 0.0
    
    @State private var date = Date.now
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
        }()
    
    var dateStr: String {
        dateFormatter.string(from: self.date)
    }
    
    var timeStr: String {
        timeFormatter.string(from: self.date)
    }
    
    @State var viewState = CGSize.zero
    
    var originalList = ["item1", "item2", "item3", "item4", "item5", "item6"]
    @State var bgColors = [Color](repeating: Color.BlackBackground, count: originalCount)
    @State var leadingPadding = [CGFloat](repeating: 25, count: 6)
    @State var trailingPadding = [CGFloat](repeating: 25, count: 6)
    @State var list = ["item1", "item2", "item3", "item4", "item5", "item6"]
    @State var systemImage = [String](repeating: "", count: 6)
    @State var iconPadding = [SwiftUI.Alignment](repeating: .center, count: 6)
    @State var padding = [Edge.Set](repeating: .leading, count: 6)
    @State var isChanging = true
    @State private var offsets = [CGSize](repeating: CGSize.zero, count: 6)
    
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
                        VStack { // testing do section from nolistswipetesting
                            ForEach(originalDos.indices, id: \.self) { index in
                                let name = dos.elements[index]
                                ZStack {
                                    Button(action: {
                                        if self.dos[name.key] == "\(self.originalList[index])completed" {
                                            self.offsets[index] = .zero
                                            self.bgColors[index] = Color.BlackBackground
                                        } else {
                                            self.list[index] = "\(self.originalList[index])completed"
                                            self.offsets[index] = .zero
                                            self.bgColors[index] = Color.BlackBackground
                                        }
                                        self.leadingPadding[index] = 25
                                        self.trailingPadding[index] = 25
                                    }) {
                                        HStack {
                                            Text("\(Image(systemName: self.systemImage[index]))")
                                                .padding([.trailing, .leading], 15)
                                        }
                                        .border(.blue)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, maxHeight: 60, alignment: self.iconPadding[index])
                                        .background(bgColors[index])
                                        .cornerRadius(10)
                                        .padding()
                                    }
                                    .padding()
                                    HStack {
                                        Text(originalDos[index])
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, maxHeight: 60)
                                            .background(Color.purple)
                                            .cornerRadius(10)
                                            //.padding()
                                    }
                                    .padding(1)
                                    .offset(x: offsets[index].width)
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                self.offsets[index] = gesture.translation
                                                if offsets[index].width > 0 {
                                                    self.bgColors[index] = Color.GreenBackground
                                                    self.leadingPadding[index] = 5
                                                    self.trailingPadding[index] = 25
                                                    self.systemImage[index] = "checkmark.circle"
                                                    self.iconPadding[index] = .leading
                                                    self.padding[index] = .leading
                                                } else if offsets[index].width < 0 {
                                                    self.bgColors[index] = Color.RedBackground
                                                    self.trailingPadding[index] = 5
                                                    self.leadingPadding[index] = 25
                                                    self.systemImage[index] = "zzz"
                                                    self.iconPadding[index] = .trailing
                                                    self.padding[index] = .trailing
                                                }
                                                let _ = print("Offset >>> \(self.offsets[index])")
                                                let _ = print("bgColor >>> \(self.bgColors[index])")
                                                let _ = print("leadingPadding >>> \(self.leadingPadding[index])")
                                                let _ = print("trailingPadding >>> \(self.trailingPadding[index])")
                                                let _ = print("systemImage >>> \(self.systemImage[index])")
                                                let _ = print("iconPadding >>> \(self.iconPadding[index])")
                                                let _ = print("padding >>> \(self.padding[index])")
                                            }
                                            .onEnded { _ in
                                                if self.offsets[index].width < -100 {
                                                    if self.list[index] == "\(self.originalList[index])snoozed" {
                                                        self.offsets[index] = .zero
                                                        self.bgColors[index] = Color.BlackBackground
                                                    } else {
                                                        self.list[index] = "\(self.originalList[index])snoozed"
                                                        self.offsets[index] = .zero
                                                        self.bgColors[index] = Color.BlackBackground
                                                    }
                                                    self.leadingPadding[index] = 25
                                                    self.trailingPadding[index] = 25
                                                }
                                                else if self.offsets[index].width > 100 {
                                                    if self.list[index] == "\(self.originalList[index])completed" {
                                                        self.offsets[index] = .zero
                                                        self.bgColors[index] = Color.BlackBackground
                                                    } else {
                                                        self.list[index] = "\(self.originalList[index])completed"
                                                        self.offsets[index] = .zero
                                                        self.bgColors[index] = Color.BlackBackground
                                                    }
                                                    self.leadingPadding[index] = 25
                                                    self.trailingPadding[index] = 25
                                                }
                                                else if self.offsets[index].width < -50 {
                                                    self.offsets[index].width = -50
                                                }
                                                else if self.offsets[index].width > 50 {
                                                    self.offsets[index].width = 50
                                                }
                                                else if (self.offsets[index].width < 50 && self.offsets[index].width > 0) || (self.offsets[index].width > -50 && self.offsets[index].width < 0){
                                                    self.offsets[index].width = .zero
                                                    self.leadingPadding[index] = 25
                                                    self.trailingPadding[index] = 25
                                                }
                                            }
                                )
                                }
                            }
                        }
                        .border(.green)
                        .padding([.trailing], -23)
                        
                        // section that contains proper dos
                        VStack (alignment: .leading) {
                            ForEach(dos.keys, id: \.self) {
                                doName in
                                VStack(alignment: .leading) {
                                    let color = Color(dos[doName] ?? "")
                                    HStack {
                                        ZStack {
                                            let doStreak = (doStreaks[doName] ?? 0) as Int
                                            let _ = print(doStreak)
                                            let streak = String(format: "%02d", doStreak)
                                            let _ = print(streak)
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
                                                Text("\(ContentView.doDescriptions[doName] ?? "")")
                                                    .frame(width: 150)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                    .lineLimit(1)
                                                    .truncationMode(.tail)
                                            } icon: {
                                                Image(systemName: "info.circle.fill")
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .padding(.leading, 5)
                                    }
                                    .padding()
                                    /*Label {
                                        Text("\(doName)" + "\n" + "\(ContentView.doDescriptions[doName ] ?? "")")
                                            .truncationMode(.tail)
                                    } icon: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(color)
                                            .frame(width: 40, height: 40)
                                    }
                                    .labelStyle(CenterAlignedLabelStyle())
                                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                            Button {
                                                print("Completing Do \'\(doName)\'")
                                                completedDos[doName] = dos[doName]
                                                dos.removeValue(forKey: doName)
                                            } label: {
                                                Label("Complete", systemImage: "checkmark.circle.fill")
                                            }
                                            .tint(.green)
                                        }
                                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                            Button {
                                                print("Snoozing Do \'\(doName)\'")
                                                snoozedDos[doName] = dos[doName]
                                                dos.removeValue(forKey: doName)
                                            } label: {
                                                Label("Snooze", systemImage: "zzz")
                                            }
                                            .tint(.orange)
                                        }*/
                                        /*VStack{
                                            DatePicker("Please enter a time", selection: $date, displayedComponents: .hourAndMinute)
                                            Text(timeStr)
                                        }*/
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 10).fill(Color.DoCardGray))
                                .padding([.top, .bottom], 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, -10)
                    } // closing brace for HStack
                    .padding(EdgeInsets(top: 1, leading: -3, bottom: 5
                                        , trailing: 1))
                } // closing brace for To Do section
                .listRowBackground(Color.clear)
                .headerProminence(.increased)
                .padding([.leading, .trailing], -10)
                Section(header:
                    Label {
                        Text("Noon")
                        .font(.title)
                } icon: {
                    Image(systemName: "fork.knife.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, Color("SymbolBackgroundGray"))
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
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: 2, maxHeight: 1000*currentProgress)
                            }
                            .onAppear(perform: self.startLoading)
                        }
                        VStack (alignment: .leading) {
                            ForEach(dos.keys, id: \.self) {
                                doName in
                                VStack(alignment: .leading) {
                                    let color = Color(dos[doName] ?? "")
                                    HStack {
                                        ZStack {
                                            let doStreak = (doStreaks[doName] ?? 0) as Int
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
                                                Text("\(ContentView.doDescriptions[doName] ?? "")")
                                                    .frame(width: 150)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                    .lineLimit(1)
                                                    .truncationMode(.tail)
                                            } icon: {
                                                Image(systemName: "info.circle.fill")
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .padding(.leading, 5)
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 10).fill(Color.DoCardGray))
                                .padding([.top, .bottom], 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, -10)
                    } // closing brace for HStack
                    .padding(EdgeInsets(top: 1, leading: -3, bottom: 5
                                        , trailing: 1))
                } // closing brace for To Do section
                .listRowBackground(Color.clear)
                .headerProminence(.increased)
                .padding(.leading, -10)
                Section(header:
                    Label {
                        Text("Evening")
                        .font(.title)
                } icon: {
                    Image(systemName: "fork.knife.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, Color("SymbolBackgroundGray"))
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
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: 2, maxHeight: 1000*currentProgress)
                            }
                            .onAppear(perform: self.startLoading)
                        }
                        VStack (alignment: .leading) {
                            ForEach(dos.keys, id: \.self) {
                                doName in
                                VStack(alignment: .leading) {
                                    let color = Color(dos[doName] ?? "")
                                    HStack {
                                        ZStack {
                                            let doStreak = (doStreaks[doName] ?? 0) as Int
                                            let _ = print(doStreak)
                                            let streak = String(format: "%02d", doStreak)
                                            let _ = print(streak)
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
                                                Text("\(ContentView.doDescriptions[doName] ?? "")")
                                                    .frame(width: 150)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                    .lineLimit(1)
                                                    .truncationMode(.tail)
                                            } icon: {
                                                Image(systemName: "info.circle.fill")
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .padding(.leading, 5)
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 10).fill(Color.DoCardGray))
                                .padding([.top, .bottom], 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, -10)
                    } // closing brace for HStack
                    .padding(EdgeInsets(top: 1, leading: -3, bottom: 5
                                        , trailing: 1))
                } // closing brace for To Do section
                .listRowBackground(Color.clear)
                .headerProminence(.increased)
                .padding(.leading, -10)
            }.frame(maxWidth: .infinity, alignment: .center)
            .background(Color.black)
            .navigationBarHidden(true)
            .padding(.leading, -15)
        }
        .onAppear {
            originalDos = ["Wake up on time", "Make your bed", "Shower", "Brush your teeth", "Use mouthwash"]
        }
    }
    
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
*/
