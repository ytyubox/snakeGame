//
// Created by 游宗諭 in 2020/12/11
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import SwiftUI

struct ContentView: View {
    @State var command: String = ""
    var body: some View {
        ZStack {
            TextField("123", text: $command)
                .keyboardType(.numberPad)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
