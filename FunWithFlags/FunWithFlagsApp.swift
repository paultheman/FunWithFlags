//
//  FunWithFlagsApp.swift
//  FunWithFlags
//
//  Created by Paul Dinu on 14.05.2023.
//

import SwiftUI


@main
struct FunWithFlagsApp: App {

    @AppStorage("selectedFlag") var selectedItem: String?
    
    @State var flag: NSImage = NSImage(systemSymbolName: "globe", accessibilityDescription: "globe")!
    
    var lastFlag: NSImage?
    
    var body: some Scene {
        //        WindowGroup {
        //            ContentView()
        //        }
        
        MenuBarExtra {
            VStack (alignment: .leading) {
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }.keyboardShortcut("q")
            }
            
            Divider()
            
            ScrollView {
                VStack {
                    ForEach (countryDict.keys.sorted(), id: \.self) { key in
                        Button(action: {
                            selectedItem = key
                            flag = resize(image: NSImage(named: countryDict[key]!)!)
                        }, label: {
                            Text(key)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                Divider()
                
                VStack {
                    ForEach (orgDict.keys.sorted(), id: \.self) { key in
                        Button(action: {
                            selectedItem = key
                            flag = resize(image: NSImage(named: orgDict[key]!)!)
                        }, label: {
                            Text(key)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            
        } label: {
            if selectedItem == nil {
                Image (nsImage: flag)
            } else if orgDict[selectedItem!] != nil  {
                Image (nsImage: resize(image: NSImage(named: orgDict[selectedItem!]!)!))
            } else {
                Image (nsImage: resize(image: NSImage(named: countryDict[selectedItem!]!)!))            }
        }
        .menuBarExtraStyle(.menu)
    }
}
