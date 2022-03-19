//
//  Main.swift
//  ArrayFlags
//
//  Created by 김수환 on 2022/03/18.
//

import Foundation


//256:"Default",
//65792:"􁂎",
//131330:"􀆝",
//131332:"R􀆝",
//131334:"B􀆝",
//262401:"􀆍",
//270592:"R􀆍",
//270593:"B􀆍",
//524576:"􀆕",
//524608:"R􀆕",
//524640:"B􀆕",
//1048840:"􀆔",
//1048848:"R􀆔",
//1048856:"B􀆔",
//8388864:"FN",





public class ArrayFlag{
    public init() {}
    var ReturnVal:[UInt] = []
    
    var FlagList:[String:UInt] = ["􁂎":0, "􀆍":0, "􀆕":0, "􀆔":0, "􀆝":0, "FN":0]
    public func ArrayedFlagNum(Val:UInt){
        if FlagMaps[Val] != nil {
            print("!@#")
            FlagList[FlagMaps[Val]!] != nil ? (FlagList[FlagMaps[Val]!]! = Val) : nil
            ReturnVal.append(Val)
        }
        else if Val > 8388864 {
            ReturnVal.append(8388864)
            FlagList["FN"] = 8388864
            return ArrayedFlagNum(Val: Val - 8388864 + 256)
        }
        else if Val > 1048840 && Val < 8388864 {
            ReturnVal.append(1048840)
            FlagList[FlagMaps[1048840]!]! = 1048840
            return ArrayedFlagNum(Val: Val - 1048840 + 256)
        }
        else if Val > 524576 && Val < 1048840 {
            ReturnVal.append(524576)
            FlagList[FlagMaps[524576]!]! = 524576
            return ArrayedFlagNum(Val: Val - 524576 + 256)
        }
        else if Val > 262401 && Val < 524640 {
            ReturnVal.append(262401)
            FlagList[FlagMaps[262401]!]! += 262401
            return ArrayedFlagNum(Val: Val - 262401 + 256)
        }
        else if Val > 131330 && Val < 270592 {
            ReturnVal.append(131330)
            FlagList[FlagMaps[131330]!]! = 131330
            return ArrayedFlagNum(Val: Val - 131330 + 256)
        }
        else if Val > 65792 {
            ReturnVal.append(65792)
            FlagList["􁂎"] = 65792
            return ArrayedFlagNum(Val: Val - 65792 + 256)
        }
        else {
            FlagLoc(Val: Val-256)
        }
        print(ReturnVal)
        print(FlagList)
    }
    func FlagLoc(Val:UInt){
        if Val >= 8191 {
            FlagList["􀆍"]! += 8191
            FlagLoc(Val: Val-8191)
        }else if Val >= 32 {
            FlagList["􀆕"]! += 32
            FlagLoc(Val: Val-32)
        }else if Val >= 8{
            FlagList["􀆔"]! += 8
            FlagLoc(Val: Val-8)
        }else if Val >= 2{
            FlagList["􀆝"]! += 2
            FlagLoc(Val: Val-2)
        }else if Val == 1{
            FlagList["􀆍"]! += 1
        }
}
}
