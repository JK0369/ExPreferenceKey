//
//  ContentView.swift
//  ExPreferenceKey
//
//  Created by 김종권 on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
  var messages: [String] {
    (0...100).map(String.init)
  }
  
  var body: some View {
    NavigationView {
      List(messages, id: \.self) { message in
        NavigationLink {
          SomeView(title: message)
        } label: {
          Text(message)
        }
      }
      .navigationBarTitle("Messages")
    }
    .onPreferenceChange(NavigationBarTitleKey.self) { title in
      print(title)
    }
  }
}

struct SomeView: View {
  let title: String
  
  var body: some View {
    Text(title)
      .navigationBarTitle(title)
      .preference(key: NavigationBarTitleKey.self, value: title)
  }
}

struct NavigationBarTitleKey: PreferenceKey {
  static var defaultValue: String = ""
  static func reduce(value: inout String, nextValue: () -> String) {
    value = nextValue()
  }
}
