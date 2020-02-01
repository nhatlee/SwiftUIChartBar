//
//  BarView.swift
//  SwiftUIBarChart
//
//  Created by nhatle on 2/1/20.
//  Copyright © 2020 VNG. All rights reserved.
//

import SwiftUI

struct BarView: View {
    var value: CGFloat = 0
    var week: String = ""
    var body: some View {
        VStack {
            ZStack(alignment: Alignment.bottom) {
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(red: 0.6666070223, green: 0.6667048931, blue: 0.6665855646))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(.white))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(.white))
                Capsule().frame(width: 20, height: value)
                    .foregroundColor(Color(.white))
                Capsule().frame(width: 20, height: value)
                    .foregroundColor(Color(.white))
            }
            Text(week)
        }
    }
}
struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}
