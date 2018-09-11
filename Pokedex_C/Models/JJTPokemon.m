//
//  JJTPokemon.m
//  Pokedex_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTPokemon.h"

@implementation JJTPokemon

- (instancetype)initWithName: (NSString *)name identifier: (NSInteger)identifier abiltiies:(NSArray<NSString *> *)abilities {
    
    self = [super init];
    if (self) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation JJTPokemon (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary {
    
    NSString *name = dictionary[@"name"];
    // let name = dictionary["name"] as? String
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    // we want to make sure these are coming back of the right type:
    // if name is not of the class NSString, return nil
    // if abilitiesDictionaries is not of the class NSArray, return nil
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    // create an empty array to put these things into when you access them
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    // loop through the abilitiesDictionaries and pull out the key for abilities and the key for name
    for (NSDictionary *dictionary in abilitiesDictionaries){
        //by tapping into the ability dictionary, can immediately grab the name
        NSString *abilityName = dictionary[@"ability"][@"name"];
        // move on through the function if abilityName is not there
        if (!abilityName) {continue; }
        // append ability name to the abilities array
        [abilities addObject:abilityName];
    }
    // use the intializer, which is like the convenience initializer in Swift
    return [self initWithName:name identifier:identifier abiltiies:abilities];
}

@end
