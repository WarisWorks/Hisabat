//
//  ContentView.swift
//  ChiqimKirim
//
//  Created by Waris Ruzi on 2022/11/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
