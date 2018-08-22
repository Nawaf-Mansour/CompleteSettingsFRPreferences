#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SCLAlertView.h"
#import "ViewController.h"
#import "FRPrefs.h"

%config(generator=internal)

#define greenColor [UIColor colorWithRed:101/255.0f green:188/255.0f blue:84/225.0f alpha:1.0f]


// بداية اكواد الواتس




@interface WAStaticTableViewController : UITableViewController
@end
@interface WASettingsViewController : WAStaticTableViewController
@end

/* نهاية اكواد الواتس*/


%hook WASettingsViewController
- (void)viewDidAppear:(_Bool)arg1{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.backgroundType = SCLAlertViewBackgroundBlur;
    
        alert.customViewColor = [UIColor colorWithRed:101/255.0f green:188/255.0f blue:84/225.0f alpha:1.0f];
    [alert addButton:@"إعدادات الواتس اب" actionBlock:^{
        %orig;
    }];
    
    [alert addButton:@"إعدادات واتس بلس" target:self selector:@selector(loadNewSettings:)];
    [alert showQuestion:nil subTitle:@"مرحباً بك في اعدادات الواتس اب" closeButtonTitle:@"إلغاء" duration:0.0f];


}

%new
- (void)loadNewSettings:(id)sender{

    FRPViewSection *headerSection = [FRPViewSection sectionWithHeight:70
    initBlock:^(UITableViewCell *cell) {
        /* design your cell as you wish */
        /* block of code executed during cell initialization */
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
        [label setText:@"إعدادات واتس"];
        [label setTextColor:[UIColor blackColor]];
       // [label setShadowColor:[UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]];
        [label setShadowOffset:CGSizeMake(1,1)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTag:111];
        
        UILabel *underLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [underLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14]];
        [underLabel setText:@"مرحباً بك في اعدادات واتس بلس"];
        [underLabel setTextColor:[UIColor grayColor]];
        [underLabel setTextAlignment:NSTextAlignmentCenter];
        [underLabel setTag:222];
        
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:underLabel];
    }
  layoutBlock:^(UITableViewCell *cell) {
      /* block of code executed during cell layoutSubviews */
      [[cell.contentView viewWithTag:111] setFrame:CGRectMake(0, -5, cell.frame.size.width, 60)];
      [[cell.contentView viewWithTag:222] setFrame:CGRectMake(0, 30, cell.frame.size.width, 60)];
  }];
    
    
    
    FRPSection *sectionSettingStatu = [FRPSection sectionWithTitle:@"إعدادات اخفاء الظهور" footer:@""];
    
    
    
    FRPSwitchCell *switchCellHideStatus = [FRPSwitchCell cellWithTitle:@"اخفاء الظهور"
                                                               setting:[FRPSettings settingsWithKey:@"SwitchHideStatus" defaultValue:@NO]
                                                      postNotification:nil
                                                           changeBlock:^(UISwitch *switchView) {
                                                               
                                                               
                                                               // NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                           }];
    [switchCellHideStatus.switchView setOnTintColor:[UIColor colorWithRed:0 green:0.545 blue:0.894 alpha:1]];
    [sectionSettingStatu addCell:switchCellHideStatus];
    
    
    FRPSwitchCell *switchCellHideTrueBlue = [FRPSwitchCell cellWithTitle:@"اخفاء الصحيين الازرق"
                                                                 setting:[FRPSettings settingsWithKey:@"SwitchHideTrueBlue" defaultValue:@NO]
                                                        postNotification:nil
                                                             changeBlock:^(UISwitch *switchView) {
                                                                 
                                                                 
                                                                 // NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                             }];
   
    [sectionSettingStatu addCell:switchCellHideTrueBlue];
    
    FRPSwitchCell *switchCellHideTrueSecond = [FRPSwitchCell cellWithTitle:@"اخفاء الصح الثاني"
                                                                   setting:[FRPSettings settingsWithKey:@"SwitchHideTrueSecond" defaultValue:@NO]
                                                          postNotification:nil
                                                               changeBlock:^(UISwitch *switchView) {
                                                                   
                                                                   
                                                                   // NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                               }];
   // [switchCellHideTrueSecond.switchView setOnTintColor:[UIColor colorWithRed:0 green:0.545 blue:0.894 alpha:1]];
    [sectionSettingStatu addCell:switchCellHideTrueSecond];
    
    FRPSwitchCell *switchCellHideReading = [FRPSwitchCell cellWithTitle:@"اخفاء القراءة"
                                                                setting:[FRPSettings settingsWithKey:@"SwitchHideReading" defaultValue:@NO]
                                                       postNotification:nil
                                                            changeBlock:^(UISwitch *switchView) {
                                                                
                                                                
                                                                // NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                            }];
    
    [sectionSettingStatu addCell:switchCellHideReading];
    
    
    
    FRPSection *sectionSettingDeleteMessage = [FRPSection sectionWithTitle:@"إعدادات حذف الرسالة" footer:@""];
    
    
    
    FRPSwitchCell *switchCellDeleteMessage= [FRPSwitchCell cellWithTitle:@"حذف الرسالة باي وقت"
                                                                 setting:[FRPSettings settingsWithKey:@"SwitchDeleteMessage" defaultValue:@NO]
                                                        postNotification:nil
                                                             changeBlock:^(UISwitch *switchView) {
                                                                 
                                                                 
                                                                 // NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                             }];
    
    [sectionSettingDeleteMessage addCell:switchCellDeleteMessage];
    
    
    FRPSwitchCell *switchCellDeleteMessageSender = [FRPSwitchCell cellWithTitle:@"عدم حذف الرسالة من المرسل"
                                                                        setting:[FRPSettings settingsWithKey:@"SwitchDeleteMessageSender" defaultValue:@NO]
                                                               postNotification:nil
                                                                    changeBlock:^(UISwitch *switchView) {
                                                                        
                                                                        
                                                                        // NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                                    }];
    
    [sectionSettingDeleteMessage addCell:switchCellDeleteMessageSender];
    
    
    
    
    FRPSection *sectionDeveloper = [FRPSection sectionWithTitle:@"" footer:@""];
    
    
    FRPLinkCell *subTableLinkCell = [FRPLinkCell cellWithTitle:@"شكراً للمطورين" selectedBlock:^(id sender) {
        
        FRPViewSection *headerSection = [FRPViewSection sectionWithHeight:50
                    initBlock:^(UITableViewCell *cell) {
                        cell.backgroundColor = [UIColor clearColor];
                        UILabel *underLabel = [[UILabel alloc] initWithFrame:CGRectZero];
                        underLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
                        [underLabel setText:@" هذه الاسماء لها شأن كبير لدي "];
                        
                        [underLabel setTextColor:[UIColor grayColor]];
                        [underLabel setTextAlignment:NSTextAlignmentCenter];
                        [underLabel setTag:111];
                        
                        [cell.contentView addSubview:underLabel];
                    }
                  layoutBlock:^(UITableViewCell *cell) {
                      /* block of code executed during cell layoutSubviews */
                      [[cell.contentView viewWithTag:111] setFrame:CGRectMake(0, -5, cell.frame.size.width, 40)];
                      
                  }];

        FRPSection *devsetion1 = [FRPSection sectionWithTitle:nil footer:nil];
        
        
        FRPDeveloperCell *dev1 = [FRPDeveloperCell cellWithTitle:@"مخلص" detail:@"@iMokhles" image:[UIImage imageNamed:@"iMokhles.png"] url:@"https://www.twitter.com/iMokhles"];
        [devsetion1 addCell:dev1];
        
        FRPDeveloperCell *dev2 = [FRPDeveloperCell cellWithTitle:@"بندر هلال" detail:@"@BandarHL" image:[UIImage imageNamed:@"BandarHL.png"] url:@"https://www.twitter.com/BandarHL"];
        [devsetion1 addCell:dev2];
        
        FRPDeveloperCell *dev3 = [FRPDeveloperCell cellWithTitle:@"فهد جويسر" detail:@"@fahadaljuwausri" image:[UIImage imageNamed:@"fahadaljuwausri.png"] url:@"https://www.twitter.com/fahadaljuwausri"];
        [devsetion1 addCell:dev3];
        
        FRPDeveloperCell *dev4 = [FRPDeveloperCell cellWithTitle:@"عثمان المطيري" detail:@"@othman_tech" image:[UIImage imageNamed:@"othman_tech.png"] url:@"https://www.twitter.com/othman_tech"];
        [devsetion1 addCell:dev4];
        
        FRPDeveloperCell *dev5 = [FRPDeveloperCell cellWithTitle:@"فؤاد راحق " detail:@"@FouadRaheb" image:[UIImage imageNamed:@"FouadRaheb.png"] url:@"https://www.twitter.com/FouadRaheb"];
        [devsetion1 addCell:dev5];
        
        FRPDeveloperCell *dev6 = [FRPDeveloperCell cellWithTitle:@"سلطان الجهني" detail:@"@Programmer_s" image:[UIImage imageNamed:@"Programmer_s.jpg"] url:@"https://www.twitter.com/Programmer_s"];
        [devsetion1 addCell:dev6];
        
        
        FRPreferences *subTable = [FRPreferences tableWithSections:@[headerSection,devsetion1] title:@"حقوق المطورين" tintColor:greenColor];
        [self.navigationController pushViewController:subTable animated:YES];
        
    }];
    
    [sectionDeveloper addCell:subTableLinkCell];
    
    [sectionDeveloper addCell:[FRPDeveloperCell cellWithTitle:@"Nawaf Mansour" detail:@"@private_apple" image:[UIImage imageNamed:@"MyLogo.png"] url:@"http://private_apple.com/twitter"]];
    
    
    FRPreferences *table = [FRPreferences tableWithSections:@[headerSection,sectionSettingStatu,sectionSettingDeleteMessage,sectionDeveloper]
                                                      title:@"آعدادات واتس بلس"
                                                  tintColor:greenColor];
    
    UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    table.navigationItem.rightBarButtonItem = heart;
    
    [self.navigationController pushViewController:table animated:YES];
    
    table.navigationController.navigationBar.tintColor = greenColor;
    
    
    
}

%end
