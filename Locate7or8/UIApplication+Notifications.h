//
//  UIApplication+Notifications.h
//
//  Created by Mark Edington on 10/7/14.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Notifications)

/// This method will detect when running on iOS 8 and perform required user notification registration
- (void)registerForUserNotifications;

@end
