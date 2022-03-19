//
//  AppDelegate.swift
//  ArrayFlags
//
//  Created by tkgka on 03/18/2022.
//  Copyright (c) 2022 tkgka. All rights reserved.
//

import Cocoa
import ArrayFlags

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var state = Wrapper()
    var statusItem: NSStatusItem?
    var popOver = NSPopover()


  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
      if !AXIsProcessTrusted() {
          print("you have to give permission to the application")
      }
      createEventTap()
      let val = ArrayFlag()
      val.ArrayedFlagNum(Val: 9437448)
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

    func createEventTap() {
      let eventTap = CGEvent.tapCreate(
        tap: .cgSessionEventTap,
        place: .headInsertEventTap,
        options: .defaultTap,
        eventsOfInterest: [.keyDown, .keyUp],
        callback: { proxy, _, cgEvent, ctx in
          if let event = NSEvent(cgEvent: cgEvent),
             let wrapper = ctx?.load(as: Wrapper.self) {
            if let newEvent = handle(event: event, cgEvent: cgEvent, wrapper: wrapper, proxy: proxy) {
              /// Quoting from https://developer.apple.com/documentation/coregraphics/cgeventtapcallback?language=swift
              /// Your callback function should return one of the following:
              /// - The (possibly modified) event that is passed in. This event is passed back to the event system.
              ///   - [we call passUnretained here since the event system is retaining the original event]
              /// - A newly-constructed event. After the new event has been passed back to the event system, the new event will be released along with the original event.
              ///   - [we call passRetained here because the event system will eventually release the event we return]
              /// - `NULL` if the event passed in is to be deleted.
              if newEvent == cgEvent {
                return .passUnretained(cgEvent)
              } else {
                return .passRetained(newEvent)
              }
            } else {
              return nil
            }
          } else {
            print("Unexpected failure to construct state or NSEvent")
            return .passUnretained(cgEvent)
          }
        }, userInfo: &state)
      if let eventTap = eventTap {
          RunLoop.current.add(eventTap, forMode: .commonModes)
        CGEvent.tapEnable(tap: eventTap, enable: true)
      }
    }
    
    
}

