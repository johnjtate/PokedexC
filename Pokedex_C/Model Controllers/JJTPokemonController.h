//
//  JJTPokemonController.h
//  Pokedex_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJTPokemon.h"

@interface JJTPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(JJTPokemon * _Nullable))completion;
// static func fetchPokemon(for searchTerm: String, completion: ((Pokemon?) -> Void)
// first Nullable for the Pokemon; second Nullable because the whole completion is optional

@end


