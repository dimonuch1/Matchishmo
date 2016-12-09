//
//  CardMachingGame.h
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMachingGame : NSObject

@property(readonly,nonatomic) NSInteger score;

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck*)deck;

-(void)chooseCardIndex:(NSUInteger)index;
-(Card*)cardAtIndex:   (NSUInteger)index;

@property(nonatomic) NSInteger numberOfMutches;

@end
