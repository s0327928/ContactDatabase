//
//  ContactDatabaseViewController.m
//  ContactDatabase
//
//  Created by Levi Orsinger on 10/6/14.
//  Copyright (c) 2014 Levi Orsinger. All rights reserved.
//

#import "ContactDatabaseViewController.h"

@interface ContactDatabaseViewController ()

@end

@implementation ContactDatabaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSave:(id)sender {
    
    ContactDatabaseAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    
    [newContact setValue: self.txtName.text forKey:@"fullname"];
    [newContact setValue: self.txtEmail.text forKey:@"email"];
    [newContact setValue: self.txtTelephone.text forKey:@"telephone"];
    
    self.txtName.text = @"";
    self.txtEmail.text = @"";
    self.txtTelephone.text = @"";
    
    NSError *error;
    [context save:&error];
    self.lblStatus.text = @"Contact Saved";
    
}

- (IBAction)btnFind:(id)sender {
    
    ContactDatabaseAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc  = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(fullname CONTAINS[cd] %@)", self.txtName.text];
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0)
    {
        self.lblStatus.text = @"No Matches";
    }
    else
    {
        matches = objects[0];
        self.txtName.text = [matches valueForKey:@"fullname"];
        self.txtEmail.text = [matches valueForKey:@"email"];
        self.txtTelephone.text = [matches valueForKey:@"telephone"];
        self.lblStatus.text = [NSString stringWithFormat:@"%lu matches found", (unsigned long)[objects count]];
    }
}
@end


































