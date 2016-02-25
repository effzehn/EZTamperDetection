//
//  EZTInvestigator.h
//  EZTamperDetection
//
//  Created by Developer on 24.02.16.
//  Copyright © 2016 Andre Hoffmann. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, EZTInvResult) {
    EZTInvestigatorNoCmp = 0,
    EZTInvResultSBCmp = 1 << 0,
    EZTInvResultFSCmp = 1 << 1,
    EZTInvResultApCmp = 1 << 2
};

@interface EZTInvestigator : NSObject

@property (nonatomic, assign) EZTInvResult result;
- (void)start;

@end
