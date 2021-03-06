//
//  CCUser.h
//  Demo
//
//  Created by Wei Kong on 12/16/10.
//  Copyright 2011 Cocoafish Inc. All rights reserved.
//

#import "CCObjectWithPhoto.h"

@interface CCUser : CCObjectWithPhoto {

	NSString *_firstName;
	NSString *_lastName;
	NSString *_email;
	NSString *_username;
    NSString *_role;
//	Boolean	_facebookAuthorized;
@private
    NSString *_facebookAccessToken;
}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *role;
//@property (nonatomic, readonly) Boolean facebookAuthorized;
@property (nonatomic, retain) NSString *facebookAccessToken;
@property (nonatomic, retain) NSDictionary *stats;

-(id)initWithId:(NSString *)objectId first:(NSString *)first last:(NSString *)last email:(NSString *)email username:(NSString *)username;

@end


