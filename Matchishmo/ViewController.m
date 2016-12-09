//
//  ViewController.m
//  Matchishmo
//
//  Created by dima on 02/12/2016.
//  Copyright © 2016 dima. All rights reserved.
//

#import "ViewController.h"
//#import "PlayingCardDeck.h"
#import "CardMachingGame.h"

@interface ViewController ()

//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
//@property (strong,nonatomic) Deck* deck;
@property (strong,nonatomic) CardMachingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numberOfMutchesSegment;

@end

@implementation ViewController

/*
-(Deck*)deck{
    if(!_deck)_deck = [self createDeck];
    return _deck;
}
*/

- (IBAction)chengeNumberOfMutches:(UISegmentedControl *)sender {
    [self dealPress:nil];
}

- (IBAction)dealPress:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}

-(Deck*) createDeck{
    //return [[PlayingCardDeck alloc]init];
    return nil;//abstract
}

-(CardMachingGame*)game{
    if(!_game) _game = [[CardMachingGame alloc]initWithCardCount:[self.cardButtons count]
                                                        usingDeck:[self createDeck]];
    _game.numberOfMutches = [self numberOfMutches];//установка необходимого количества совпадающих карт
    return _game;
}

//возврат необходимог количества совпадающих карт
-(NSInteger) numberOfMutches{
    return self.numberOfMutchesSegment.selectedSegmentIndex+2;
}

/*
-(void)setFlipCount:(int)flipCount{
    //_flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",self.flipCount];
}
*/



- (IBAction)touchCardButton:(UIButton *)sender {
    /*
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
    */
    
    NSInteger choosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardIndex:choosenButtonIndex];
    [self updateUI];
    //self.flipCount++;
}

-(void)updateUI{
    
    for(UIButton* cardButton in self.cardButtons){
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroungImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",self.game.score];
    }
}

-(NSString*)titleForCard:(Card*)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*)backgroungImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}

@end
