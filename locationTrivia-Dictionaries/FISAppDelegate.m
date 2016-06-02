//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length{
    NSString *shortenedString = @"";
    NSString *stringToShorten = location[@"name"];
    NSUInteger stringLength = [stringToShorten length];
    if (length <= stringLength) {
        shortenedString = [stringToShorten substringToIndex:length];
        return shortenedString;
    }
    return stringToShorten;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    NSMutableDictionary *locationDict = [@{@"name" : name,
                                          @"latitude" : @(latitude),
                                           @"longitude" : @(longitude)}mutableCopy];
    return locationDict;
}

-(NSArray *)namesOfLocations:(NSArray *)locations{
    NSMutableArray *keyNames = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in locations) {
        [keyNames addObject:dict[@"name"]];
    }
    return keyNames;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    NSMutableArray *dictKeys = [[dictionary allKeys]mutableCopy];
    NSMutableArray *expectedKeys = [@[@"name", @"latitude", @"longitude"]mutableCopy];
    NSSortDescriptor *alphabetizeKeys = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    [dictKeys sortUsingDescriptors:@[alphabetizeKeys]];
    [expectedKeys sortUsingDescriptors:@[alphabetizeKeys]];
    
    BOOL containsCorrectKeys = NO;
    if ([dictKeys isEqualToArray:expectedKeys]) {
        containsCorrectKeys = YES;
    }
    
    return containsCorrectKeys;
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    for (NSDictionary *dict in locations) {
        if ([name isEqualToString:dict[@"name"]]) {
            return dict;
        }
    }
    return nil;
}

@end
