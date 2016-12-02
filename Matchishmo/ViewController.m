//
//  ViewController.m
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property(strong,nonatomic) Deck* deck;

@end

@implementation ViewController

-(Deck*)deck{
    if(!_deck)_deck = [self createDeck];
    return _deck;
}

-(Deck*) createDeck{
    return [[PlayingCardDeck alloc]init];
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length]!=0){
    [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"]
                      forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        Card* card = [self.deck drawRandomCard];
        if(card){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
    
    
}

@end
