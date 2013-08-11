
//  Created by Derrick Liu on 8/8/13.
//  Copyright (c) 2013 TheSneakyNarwhal. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

bool blockTouched;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        NSString *string1 =
        
       @"[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAABAAAAAACAAAAAAAAA]"
        "[AAAAAAAADEAAAAAAAAAA]"
        "[AAAAAAAAFGAAAAAAAAAA]"
        "[AAAAAAAAHIAAAAAABAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAACAAA]"
        "[AAAAAAAABAAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAAAACAAAAAAAA]"
        "[AABAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAADEAAA]"
        "[AAAAAAAAAAAAAAAFGAAA]"
        "[AAAAAAAAAAAAAAAHIAAA]"
        "[AAAACAAAAAAAAAAAAAAB]"
        "[AAAAAAAAACAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAADEAAAAAAAAAAAAAAA]"
        "[AAAFGAAAAAAAAAAACAAA]"
        "[AAAHIAAAAAAAAAABAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAAAAAADEAAAAAAAAA]"
        "[AAABAAAAAFGAAAAAAAAA]"
        "[AAAAAAAAAHIAAAAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]"
        "[AAAAACAAAAAAABAAAAAA]"
        "[AAAAAAAAAAAAAAAAAAAA]";
 
        
        [self placeTiles:string1];

    }
    return self;
}

-(void)placeTiles:(NSString*)theString
{
    for  (int i = 0; i <= [[theString componentsSeparatedByString:[theString substringFromIndex:[theString length] - 1]] count]-1; i++)
    {
        NSString *layer = [[[[[[theString componentsSeparatedByString:[theString substringFromIndex:[theString length] - 1]] reverseObjectEnumerator] allObjects] componentsJoinedByString:@""] componentsSeparatedByString:[theString substringToIndex:1]] objectAtIndex:i];
        for (int w = 0; w < [layer length]; w++)
        {
            NSString *oneChar  = [NSString stringWithFormat:@"%c", [layer characterAtIndex:w]];
            if (![oneChar isEqualToString:@" "])
            {
                SKSpriteNode *tile = [SKSpriteNode spriteNodeWithImageNamed:oneChar];
                tile.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:tile.size];
                tile.physicsBody.dynamic = NO;
                switch (w)
                {
                    case 0:
                        tile.position = CGPointMake(tile.size.width/2, (tile.size.height * i) - tile.size.height/2);
                        break;
                        
                    default:
                        tile.position = CGPointMake((tile.size.width * w) + tile.size.width/2, (tile.size.height * i) - tile.size.height/2);
                        break;
                }
                [self addChild:tile];
            }
        }
    }
}
@end
