//
//  EventHandler.swift
//  ArrayFlags
//
//  Created by 김수환 on 2022/03/19.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import Cocoa
import ArrayFlags

class Wrapper {
  var state: State?

  class State {
    init(mouseDownEvent: CGEvent) {
      self.mouseDownEvent = mouseDownEvent
    }
      
    var mouseDownEvent: CGEvent
    var task: DispatchWorkItem!
    var isRight = false
    var mouseMoves: [CGPoint] = []

  }
}


func handle(event: NSEvent, cgEvent: CGEvent, wrapper: Wrapper, proxy: CGEventTapProxy) -> CGEvent? {
    if (event.type == .keyDown) {
        print(event.modifierFlags.rawValue)
        print("GetDictFlags",GetDictFlags(Val: event.modifierFlags.rawValue))
        print("GetArrayFlags",GetArrayFlags(Val: event.modifierFlags.rawValue))
        print("GetDictFlagsString",GetDictFlagsString(Val: event.modifierFlags.rawValue))
    }
    
    return cgEvent
}
