//
//  Card.h
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong,nonatomic) NSString* contents;

@property(nonatomic,getter=isChoisen) BOOL chosen;
@property(nonatomic,getter=isMatched) BOOL matched;

-(int)match:(NSArray*) otherCards;

@end
