//
//  CCUser.m
//  Demo
//
//  Created by Wei Kong on 12/16/10.
//  Copyright 2011 Cocoafish Inc. All rights reserved.
//

#import "CCUser.h"
#import "CCPhoto.h"
#import "Cocoafish.h"
#import "CCDownloadManager.h"

/*@interface CCUser ()

@property (nonatomic, retain, readwrite) NSString *email;
@property (nonatomic, retain, readwrite) NSString *username;
@property (nonatomic, retain, readwrite) NSString *firstName;
@property (nonatomic, retain, readwrite) NSString *lastName;
//@property (nonatomic, readwrite) Boolean facebookAuthorized;
@property (nonatomic, retain, readwrite) NSString *facebookAccessToken;

@end*/

@implementation CCUser

@synthesize email = _email;
@synthesize username = _username;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize role = _role;
//@synthesize facebookAuthorized = _facebookAuthorized;
@synthesize facebookAccessToken = _facebookAccessToken;
@synthesize stats = _stats;

-(id)initWithJsonResponse:(NSDictionary *)jsonResponse
{
	self = [super initWithJsonResponse:jsonResponse];
	if (self) {

		self.email = [jsonResponse objectForKey:CC_JSON_USER_EMAIL];
		self.username = [jsonResponse objectForKey:CC_JSON_USERNAME];
		self.firstName = [jsonResponse objectForKey:CC_JSON_USER_FIRST];
		self.lastName = [jsonResponse objectForKey:CC_JSON_USER_LAST];
		//self.facebookAuthorized = [[jsonResponse objectForKey:CC_JSON_USER_FACEBOOK_AUTHORIZED] boolValue];
        self.facebookAccessToken = [jsonResponse objectForKey:CC_JSON_USER_FACEBOOK_ACCESS_TOKEN];
        self.role = [jsonResponse objectForKey:@"role"];
        self.stats = [jsonResponse objectForKey:@"stats"];
        if (self.firstName == nil && self.lastName == nil && self.username == nil) {
            NSLog(@"Invalid user object from server: %@", jsonResponse);
            [self release];
            self = nil;
            return self;
        }
	}
	return self;
}

-(id)initWithId:(NSString *)objectId first:(NSString *)first last:(NSString *)last email:(NSString *)email username:(NSString *)username
{
	if (objectId == nil || (email == nil && username == nil)) {
        [self release];
		return nil;
	}
	if ((self = [super initWithId:objectId])) {
		self.firstName = first;
		self.lastName = last;
		self.email = email;
        self.username = username;
	}
	return self;
}

/*- (NSString *)description {
    return [NSString stringWithFormat:@"CCUser:\n\temail: %@\n\tuserName: %@\n\tfirst: %@\n\tlast: %@\n\tfacebookAccessToken :%@\n%@",
            self.email, self.username, self.firstName, self.lastName, self.facebookAccessToken, [super description]];
}

-(id)copyWithZone:(NSZone *)zone  
{
    CCUser *copy = [super copyWithZone:zone];
    copy.email = [_email copy];
    copy.username = [_username copy];
    copy.firstName = [_firstName copy];
    copy.lastName = [_lastName copy];
    copy.facebookAccessToken = [_facebookAccessToken copy];
    copy.role = [_role copy];
    return copy;
}*/

+(NSString *)modelName
{
    return @"user";
}

+(NSString *)jsonTag
{
    return @"users";
}

-(void)dealloc
{
	self.email = nil;
	self.username = nil;
	self.firstName = nil;
	self.lastName = nil;
    self.facebookAccessToken = nil;
    self.role = nil;
    self.stats = nil;
	[super dealloc];
}

@end


