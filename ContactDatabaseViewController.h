//
//  ContactDatabaseViewController.h
//  ContactDatabase
//
//  Created by Levi Orsinger on 10/6/14.
//  Copyright (c) 2014 Levi Orsinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDatabaseAppDelegate.h"

@interface ContactDatabaseViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtTelephone;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnFind:(id)sender;

@end
