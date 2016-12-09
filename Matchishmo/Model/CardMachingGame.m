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

-(void) setNumberOfMutches:(NSInteger)numberOfMutches{
    _numberOfMutches = numberOfMutches >=2 ? numberOfMutches : 2;
}

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
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

//static const int MISMATCH_PENALTY = 2;
#define MISMATCH_PENALTY 2;
#define MATCH_BONUS 4;
#define COST_TO_CHOOSE 1;

-(void)chooseCardIndex:(NSUInteger)index{
    
    Card* card = [self.cards objectAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
           card.chosen = NO;
        } else {
            for(Card* otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;//can only choose 2 cards for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
