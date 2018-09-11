//
//  JJTPokemonController.m
//  Pokedex_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTPokemonController.h"

static NSString * const baseURLString  = @"https://pokeapi.co/api/v2/pokemon/";

@implementation JJTPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(JJTPokemon * _Nullable))completion {
    
    // ensure that the completion is not nil
    if (!completion) {
        completion  = ^(JJTPokemon *p){};
    }
    
    //1) Construct URL/URL Request
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:searchURL];
    
    
    // print out the URL to the console
    NSLog([searchURL absoluteString]);
    
    //2) URLSession.shared.dataTask with completion
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__ ,error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
        
        // options is an enum; we feed in a raw value of 0 in this case
        if (data) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
                NSLog(@"Error parsing the json: %@", error);
                completion(nil);
                return;
            }
            // init Pokemon with the dictionary
            JJTPokemon *pokemon = [[JJTPokemon alloc] initWithDictionary:dictionary];
            completion(pokemon);
        }
        
    }] resume];
    
}

@end


