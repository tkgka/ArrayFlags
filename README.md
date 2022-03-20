# ArrayFlags

[![CI Status](https://img.shields.io/travis/tkgka/ArrayFlags.svg?style=flat)](https://travis-ci.org/tkgka/ArrayFlags)
[![Version](https://img.shields.io/cocoapods/v/ArrayFlags.svg?style=flat)](https://cocoapods.org/pods/ArrayFlags)
[![License](https://img.shields.io/cocoapods/l/ArrayFlags.svg?style=flat)](https://cocoapods.org/pods/ArrayFlags)
[![Platform](https://img.shields.io/cocoapods/p/ArrayFlags.svg?style=flat)](https://cocoapods.org/pods/ArrayFlags)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ArrayFlags is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ArrayFlags'
```

## Usage
First, add **import ArrayFlags** on every swift file you would like to use ArrayFlags.

Then, use functions to return arrayed flags!

**"GetDictFlags"** and **"GetDictFlagsString"** returns Dict type value and **"GetArrayFlags"** returns array value

Parameters:

Val: Uint value which convert to array type

```swift
print("GetDictFlags",GetDictFlags(Val: NSEvent.modifierFlags.rawValue)) // return Seperated Flag value by Dict type
print("GetArrayFlags",GetArrayFlags(Val: NSEvent.modifierFlags.rawValue)) //return arrayed Flag value
print("GetDictFlagsString",GetDictFlagsString(Val: NSEvent.modifierFlags.rawValue)) // return pressed key value by Dict type
```        
![image](https://user-images.githubusercontent.com/52348220/159162961-72a69a55-4204-40d2-a3ae-844d96fcacf0.png)

**"GetDictFlagsString"** function returns **L**, **R** or **B** for shift, ctrl, option and command flags

**"L"** means Left key pressed

**"R"** means Right key pressed

**"B"** means Both key pressed

## Author

tkgka, ksh17171@gmail.com


## License

ArrayFlags is available under the MIT license. See the LICENSE file for more info.
