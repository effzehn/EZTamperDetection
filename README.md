# EZTamperDetection

[![CI Status](http://img.shields.io/travis/Andre Hoffmann/EZTamperDetection.svg?style=flat)](https://travis-ci.org/Andre Hoffmann/EZTamperDetection)
[![Version](https://img.shields.io/cocoapods/v/EZTamperDetection.svg?style=flat)](http://cocoapods.org/pods/EZTamperDetection)
[![License](https://img.shields.io/cocoapods/l/EZTamperDetection.svg?style=flat)](http://cocoapods.org/pods/EZTamperDetection)
[![Platform](https://img.shields.io/cocoapods/p/EZTamperDetection.svg?style=flat)](http://cocoapods.org/pods/EZTamperDetection)

### A simple tamper detection for iOS written in ObjC ###

This tamper detection can be integrated into an iOS Application or Framework. It tests for common hot spots on jailbroken devices:

* an open sandbox
* filesystem abnormalities
* Application directory type
* existence of certain dynamic libraries

On a vanilla jailbroken iOS 9.0.2 device it detects filesystem abnormalities and if the Application directory is replaced by a symbolic link. Method names are rather cryptic on purpose.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

The example needs iOS 9.0 to compile.

## Installation

EZTamperDetection is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EZTamperDetection"
```

## Author

Andre Hoffmann, dev@effzehn.de

## License

EZTamperDetection is available under the MIT license. See the LICENSE file for more info.
