//
//  PinItApp.swift
//  PinIt
//
//  Created by George Grigalashvili on 31.01.23.
//

import SwiftUI
import Cocoa

@main
struct PinItApp: App {
    let persistenceController = PersistenceController.shared
    @State var currentWindow: String = "1"

    var visibleWindows: [[String:Any]]
    var names: [String]

    init() {
        let options = CGWindowListOption(arrayLiteral: .excludeDesktopElements, .optionOnScreenOnly)
        let windowsListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
        let infoList = windowsListInfo as! [[String:Any]]
        visibleWindows = infoList.filter{ $0["kCGWindowLayer"] as! Int == 0 }
        names = infoList.map {$0["kCGWindowOwnerName"] as! String}

    }

    var body: some Scene {
        MenuBarExtra(currentWindow, systemImage:  "pin") {
            ForEach(names, id: \.self){ n in
                Button("\(n)") {
                    // TODO
                    // here we need full Window(CGWindow) object or derivative of it that has floating property

                    // Note, no idea why I picked CGWindow and not NS
                }
            }
            Divider()
            Button("Exit") {
                 NSApplication.shared.terminate(nil)
            }
        }
    }
}



