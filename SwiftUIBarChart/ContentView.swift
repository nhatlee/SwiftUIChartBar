//
//  ContentView.swift
//  SwiftUIBarChart
//
//  Created by nhatle on 2/1/20.
//  Copyright © 2020 VNG. All rights reserved.
//

import SwiftUI

/*
 Added overlay layer
 */

struct ContentView: View {
    @State var showOverlay = false
    @State var curColor = Color.blue
    
    var body: some View {
        Text("Tap me to Show/Hide overlay")
            .multilineTextAlignment(.center)
            .frame(width: 100, height: 100)
            .background(curColor)
            .cornerRadius(20)
            .onTapGesture { self.showOverlay.toggle() }
            .overlay( ArcSelectionView(isShowing: self.$showOverlay, curColor: self.$curColor) )
    }
}

struct ArcSelectionView: View {
    @Binding var isShowing : Bool
    @Binding var curColor : Color
    
    let colors = [Color.blue, Color.red, Color.green, Color.yellow]
    
    var body: some View {
        ZStack {
            ForEach(1 ..< 5, id: \.self) { item in
                Circle()
                    .trim(from: self.isShowing ? CGFloat((Double(item) * 0.25) - 0.25) : CGFloat(Double(item) * 0.25),
                          to: CGFloat(Double(item) * 0.25))
                    .stroke(self.colors[item - 1], lineWidth: 30)
                    .frame(width: 300, height: 300)
                    .animation(.linear(duration: 0.4))
                    .onTapGesture {
                        self.curColor = self.colors[item - 1]
                        self.isShowing.toggle()
                }
            }
        }
        .opacity(self.isShowing ? 1 : 0)
        .rotationEffect(.degrees(self.isShowing ? 0 : 180))
        .animation(.linear(duration: 0.5))
    }
}




/*
Some base components
 */

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Rectangle()
//                .fill(Color.black)
//                .frame(width: 200, height: 200)
//
//            RoundedRectangle(cornerRadius: 25, style: .continuous)
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
//
//            Capsule()
//                .fill(Color.green)
//                .frame(width: 100, height: 50)
//
//            Ellipse()
//                .fill(Color.blue)
//                .frame(width: 100, height: 50)
//
//            Circle()
//                .fill(Color.yellow)
//                .frame(width: 100, height: 50)
//
//            Button(action: {
//                print("Button tapped")
//            }) {
//                Image(systemName: "bolt.fill")
//                    .foregroundColor(.white)
//                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
//                    .background(Color.green)
//                    .clipShape(Capsule())
//            }
//        }
//    }
//}


/*
 Chart view
 */
//struct ContentView: View {
//    @State private var pickerSelectedItem = 0
//    @State private var dataPoints: [[CGFloat]] = [
//        [100, 120, 150],
//        [150, 100, 120],
//        [120, 150, 100],
//        [120, 100, 150],
//        [130, 50, 100]
//    ]
//    var body: some View {
//        ZStack {
//            Color(.orange).edgesIgnoringSafeArea(.all)
//            VStack {
//                Text("BAR CHART")
//                    .font(.system(size: 28))
//                    .fontWeight(.medium)
//                    .foregroundColor(Color(.white))
//                Picker(selection: $pickerSelectedItem, label: Text("")) {
//                    Text("Weekly").tag(0)
//                    Text("Monthly").tag(1)
//                    Text("Yearly").tag(2)
//                    Text("Leap Year").tag(3)
//                    Text("Weekend").tag(4)
//                }.pickerStyle(SegmentedPickerStyle())
//                    .padding(.horizontal, 24)
//                HStack(spacing: 8) {
//                    BarView(value: dataPoints[pickerSelectedItem][0], week: "D")
//                    BarView(value: dataPoints[pickerSelectedItem][1], week: "D")
//                    BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
//                    BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
//                    BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
//                }.padding(.top, 24)
//                    .animation(.default)
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
