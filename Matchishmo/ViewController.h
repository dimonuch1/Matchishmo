//
//  ViewController.h
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

//proptected
//for subclasses

-(Deck*) createDeck; //abstract

@end

