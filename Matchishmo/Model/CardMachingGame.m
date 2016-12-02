//
//  CardMachingGame.m
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import "CardMachingGame.h"


@interface CardMachingGame()

@property(nonatomic,readwrite) NSInteger score;
@property(strong,nonatomic) NSMutableArray* cards;

@end

@implementation CardMachingGame

-(NSMutableArray*) cards{
    if(!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}

//designated initializer
-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        for(int i = 0;i < count; i++){
            Card* card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            } else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card*) cardAtIndex:(NSUInteger)index{
    return self.cards[index];
}

@end
