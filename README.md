# EZTamperDetection
A simple tamper detection for iOS written in ObjC

This tamper detection can be integrated into an iOS Application or Framework. It tests for common hot spots on jailbroken devices:

* an open sandbox
* filesystem abnormalities
* Application directory type
* existence of certain dynamic libraries

On a vanilla jailbroken iOS 9.0.2 device it detects filesystem abnormalities and if the Application directory is replaced by a symbolic link. Method names are rather cryptic on purpose.
