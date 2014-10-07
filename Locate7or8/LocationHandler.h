//
//  LocationHandler.h
//
//  Created by Mark Edington on 10/6/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/// Simplisitc sample code to use CLLocationManager significant change services
@interface LocationHandler : NSObject<CLLocationManagerDelegate>

+ (instancetype)sharedManager;

- (void)startLocationServices;

@end
