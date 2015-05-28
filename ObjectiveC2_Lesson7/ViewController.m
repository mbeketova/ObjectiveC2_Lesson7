//
//  ViewController.m
//  ObjectiveC2_Lesson7
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"
#import "Operation.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()
/*
ДЗ- Необходимо установить POD, через POD установить внешнюю библиотеку AFNetworking
Используя АПИ социальной сети Вконтакте реализовать получение id сообщества на свой выбор.
*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
    Operation * oper = [Operation new];
    //класс, который осуществляет операции в бекграунде
    NSOperationQueue * q = [[NSOperationQueue alloc]init];
    [q addOperation:oper];

    [self first_Method];
    [self getJSON]; 
 */
    
//Отправляем запрос на получение ID объекта и его типа:
    
    [self get_DataFromWall];
    
  
}


- (void) get_DataFromWall {
    
    NSURL * url = [NSURL URLWithString:@"https://api.vk.com/method/"];
    AFHTTPRequestOperationManager * reqManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    
    NSDictionary * dictParam = [[NSDictionary alloc]initWithObjectsAndKeys:
                                @"dfilm", @"screen_name",
                                nil];
    
    [reqManager GET:@"utils.resolveScreenName" parameters:dictParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //проверка на то, какой класс приходит:
//        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//
//            NSLog(@"NSDictionary responseObject: %@", responseObject);
//            
//        }
//        
//        else if ([responseObject isKindOfClass:[NSArray class]]) {
//          NSLog(@"NSArray responseObject: %@", responseObject);
//            
//        }
//        else {
//           NSLog(@"Unknown class");
//        }
        
        NSDictionary * dictVK = [responseObject objectForKey:@"response"];
        NSString * stringID = [dictVK objectForKey:@"object_id"];
        
        NSLog(@"ID группы dfilm: %@",stringID);
        

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error %@",error);
    }];
    
  

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/*
- (void) first_Method {
    //клиент
    SEL selector = @selector(result:Str2:);
    NSString * stringSelector = NSStringFromSelector(selector);
    
    NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys:
                           @"string1", @"STR1",
                           @"string2", @"STR2",
                           stringSelector, @"selector", nil];
    
    
    
    [self method:dict];
    
}

- (void) method: (NSDictionary*)dict {
    //сервер
    
    SEL selector = NSSelectorFromString([dict valueForKey:@"selector"]);
    [self performSelector:selector withObject:[dict valueForKey:@"STR1"] withObject:[dict valueForKey:@"STR2"]];
    
    
}


- (void) result: (NSString*)stringOne Str2:(NSString*)stringTwo {
    
    //результат после серверной обработки
   // NSLog(@"%@", [NSString stringWithFormat:@"%@ + %@",stringOne, stringTwo]);
}
 


- (void) getJSON {
    
    //упаковка в JSON - формат
    
    NSArray * array1 = [[NSArray alloc]initWithObjects:@"aaa", @"bbb", @"ccc", nil];
    
    NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys:
                           @"string1", @"STR1",
                           @"string2", @"STR2",
                           array1, @"array1", nil];
    
    NSArray * array2 = [[NSArray alloc]initWithObjects:dict, nil];
    
    NSDictionary * dict2 = [[NSDictionary alloc]initWithObjectsAndKeys:
                            @"string1", @"STR1",
                            @"string2", @"STR2",
                            array2, @"array2", nil];
    
    NSArray * array3 = [[NSArray alloc]initWithObjects:dict2, nil];
    
    NSError * error = nil;
    
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:array3 options:NSJSONWritingPrettyPrinted error:&error];
    
    if ([jsonData length] >0 && error == nil) {
        NSString*jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonString %@", jsonString);
    }
    
    NSString * urlString = @"http://echo.jsontest.com/key/value/one/two";
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest* req = [[NSMutableURLRequest alloc]initWithURL:url];
    NSOperationQueue * q = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:req queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //распаковка:
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if (jsonObject!=nil) {
            if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                // NSDictionary * dict = (NSDictionary*)jsonObject;
                NSLog(@"NSDictionary jsonObject: %@", jsonObject);
            }
            
            else if ([jsonObject isKindOfClass:[NSArray class]]) {
                NSLog(@"NSArray jsonObject: %@", jsonObject);
                
            }
            else {
                NSLog(@"Unknown class");
            }
        }
    }];
    

}

 */

@end
