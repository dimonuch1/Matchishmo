//
//  PlayingCard.h
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic) NSString* suit;
@property(nonatomic)        NSUInteger rank;

+(NSArray*)   validSuits;
+(NSInteger) maxRank;

@end
