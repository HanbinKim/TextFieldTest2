//
//  ViewController.m
//  TextFieldTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 0, 0)];
    label1.text = @"Return";
    label1.textColor = [UIColor whiteColor];
    label1.backgroundColor = [UIColor clearColor];
    [label1 sizeToFit];
    [self.view addSubview:label1];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 75, 0, 0)];
    label2.text = @"편집 불가";
    label2.textColor = [UIColor whiteColor];
    label2.backgroundColor = [UIColor clearColor];
    [label2 sizeToFit];
    [self.view addSubview:label2];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 125, 0, 0)];
    label3.text = @"Z 입력금지";
    label3.textColor = [UIColor whiteColor];
    label3.backgroundColor = [UIColor clearColor];
    [label3 sizeToFit];
    [self.view addSubview:label3];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(130, 20, 171, 31)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.tag = 1;
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(130, 70, 171, 31)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.delegate = self;
    textField2.tag = 2;
    UITextField *textField3 = [[UITextField alloc] initWithFrame:CGRectMake(130, 120, 171, 31)];
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.delegate = self;
    textField3.tag = 3;
    
    [self.view addSubview:textField];
    [self.view addSubview:textField2];
    [self.view addSubview:textField3];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(2==textField.tag)
        return NO;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"INPUT : %@",textField.text);
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(3 == textField.tag && NSOrderedSame == [string compare:@"z" options:NSCaseInsensitiveSearch])
        return NO;
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
