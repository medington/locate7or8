//
//  UIApplication+Notifications.m
//
//  Created by Mark Edington on 10/7/14.
//

#import "UIApplication+Notifications.h"

/// Private category required to compile with iOS 7 SDK
/// Reference: http://stackoverflow.com/a/24920131/26219
@interface NSObject (IOS8)

+ (id)settingsForTypes:(NSUInteger)types categories:(NSSet*)categories;
- (void)registerUserNotificationSettings:(id)settings;

@end

@implementation UIApplication (Notifications)

- (void)registerForUserNotifications
{
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        //typedef NS_OPTIONS(NSUInteger, UIUserNotificationType)
        NSUInteger UIUserNotificationTypeBadge   = 1 << 0; // the application may badge its icon upon a notification being received
        NSUInteger UIUserNotificationTypeSound   = 1 << 1; // the application may play a sound upon a notification being received
        NSUInteger UIUserNotificationTypeAlert   = 1 << 2; // the application may display an alert upon a notification being received

        Class uiUserNotificationSettings = NSClassFromString(@"UIUserNotificationSettings");
        id notificationSettings = [uiUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];

        [self registerUserNotificationSettings:notificationSettings];
    }
}

@end
