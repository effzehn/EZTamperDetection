//
//  EZTInvestigator.m
//  EZTamperDetection
//
//  Created by Developer on 24.02.16.
//  Copyright © 2016 Andre Hoffmann. All rights reserved.
//

#import "EZTInvestigator.h"

#include <spawn.h>
#include <sys/stat.h>
#include <mach-o/dyld.h>


@implementation EZTInvestigator

- (void)start {
    [self sbIntt];
    [self fsIntt];
    [self apIntt];
    [self dyIntt];
}

// Test the sandbox integrity.
// fork() attempts to spawn a new child process which is not allowed within the sandbox
// Functionality is not a given on a jailbroken device.
- (void)sbIntt {
    int result = fork();
    
    if (!result) {
        exit(0);
    }
    if (result >= 0) {
        self.result |= EZTInvResultSBCmp;
    }
}

// Tests for filesystem abnormalities
- (void)fsIntt {
    NSArray *locs = @[@"/Library/MobileSubstrate/MobileSubstrate.dylib",
                      @"/Applications/Cydia.app",
                      @"/var/cache/apt",
                      @"/var/lib/apt",
                      @"/var/log/syslog",
                      @"/var/tmp/cydia.log",
                      @"/bin/bash",
                      @"/bin/sh"];
    
    for (NSString *loc in locs) {
        struct stat s;
        const char *l = [loc UTF8String];
        if (stat(l, &s) == 0) {
            self.result |= EZTInvResultFSCmp;
        }
    }
}

// Test for symbolic linking
// Some jailbreaks replace the original application directory with a symbolic link
- (void)apIntt {
    struct stat s;
    if (lstat("/Applications", &s) == 0) {
        if (s.st_mode & S_IFLNK) {
            self.result |= EZTInvResultApCmp;
        }
    }
}

// Calling dyld functions
// A jailbroken device typically contains suspicious dynamic libraries
- (void)dyIntt {
    uint32_t image_count, i;
    image_count = _dyld_image_count();
    for (i = 0; i < image_count; i++) {
        const char* tc = _dyld_get_image_name(i);
        NSString *test = [NSString stringWithCString:tc encoding:NSUTF8StringEncoding];
        
        if ([test containsString:@"MobileSubstrate.dylib"] || [test containsString:@"SubstrateLoader.dylib"]) {
            self.result |= EZTInvResultDyCmp;
        }
    }
}

// Blocking the debugger
// We can deny any attachment of a debugger with ptrace deny.
- (void)ptDeny {
    // ptrace(31, 0, 0, 0);
    // to test #include </usr/include/sys/ptrace.h>
    // Usage might result in a review rejection!
}

@end