//
//  ContentView.swift
//  BeginingIphone
//
//  Created by Student Account on 10/9/23.
/*
 -HomeView
 -ProfileView
 -SettingView
 .*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("This is the Home View")
            .font(.largeTitle)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("This is the Profile View")
            .font(.largeTitle)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("This is the Settings View")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

