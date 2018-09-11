//
//  JJTPokemon.h
//  Pokedex_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJTPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

- (instancetype)initWithName: (NSString *)name identifier: (NSInteger)identifier abiltiies:(NSArray<NSString *> *)abilities;

@end

// this is like an extension
@interface JJTPokemon (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
// init(with dictionary: [String : Any])


@end
