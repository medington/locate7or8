//
//  LocationHandler.m
//
//  Created by Mark Edington on 10/6/14.
//
//

#import "LocationHandler.h"
#import "UIApplication+Notifications.m"

@interface LocationHandler ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation LocationHandler

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    return self;
}

- (void)startLocationServices {
    UIApplication *application = [UIApplication sharedApplication];

    // Register for User Notification as required for iOS 8
    [application registerForUserNotifications];

    // Request "Always" location services authorization required for iOS8
    if (([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) &&
        [self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager performSelector:@selector(requestAlwaysAuthorization) withObject:nil];
    }

    [self.locationManager startMonitoringSignificantLocationChanges];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self notifyUser:@"didUpdateLocation called"];
}

/// Helper to display local notifications
- (void)notifyUser:(NSString *)message {
    NSString *msgTime = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                       dateStyle:NSDateFormatterMediumStyle
                                                       timeStyle:NSDateFormatterMediumStyle];

    NSString *msg = [NSString stringWithFormat:@"%@: %@", msgTime, message];
    NSLog(@"%@", msg);

    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif) {
        localNotif.alertBody = msg;
        [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
    }
}

@end
