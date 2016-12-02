//
//  Deck.h
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card*)card atTop:(BOOL)atTop;
-(void) addCard:(Card*)card;
-(Card*) drawRandomCard;

@end
