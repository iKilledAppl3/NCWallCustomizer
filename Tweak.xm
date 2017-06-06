//NCWallCustomizer is a tweak by iKilledAppl3

//Written on May 17, 2017

//Originally thought of around the same time as CCWallCustomizer

//All code belongs to me :P

//Do as you please!

//headers
#import <UIKit/UIKit.h>
#import "NCWallCustomizer.h"

//image path for file system 
#define customImgPath @"/var/mobile/Documents/ncwall.png" 

//prefs BOOL values 
static BOOL kEnabled;

//class we hook 
%hook SBNotificationCenterViewController

//pointer we modify in the class
-(void)viewDidLoad {

   //see if tweak is on and do a thing 
      if (kEnabled == YES) {
      //call original method 
       %orig;
    //call a new method 
   //MSHookIvar is our friend 
//using this to access the background view of the Notification Center so we can call a custom image view 
     UIView *backgroundView = MSHookIvar  <UIView *>(self, "_backgroundView");

//custom image view and image path to retrieve image from file system 
 UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:customImgPath]];
 
 //fit to the view
 imgView.contentMode = UIViewContentModeScaleAspectFill;
 //set the image bounds to the view
 imgView.bounds = backgroundView.bounds;
 //set image frame to one in the view
 imgView.frame = backgroundView.frame;
 //make the image clips to bounds
 imgView.clipsToBounds = YES;
 //fix landscape bug 
 imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;

//add the image view as a sub view of the background view 
[backgroundView addSubview:imgView];

}

//if tweak is off 
   else {
//Do original thing 
%orig;

}

  }

//Disable background blur
//fixes dark image issues

-(void)setBlursBackground:(BOOL)arg1 {
  //see if tweak is on and do a thing 
      if (kEnabled == YES) {
             NO;

    }

              else {
         //call original method 
        %orig;

      }


}

-(BOOL)blursBackground {
  //see if tweak is on and do a thing 
      if (kEnabled == YES) {
             return FALSE;

    }

              else {
         //call original method 
             return %orig;

      }


}

%end

//Disable background blur 
//fixes dark image issues

%hook SBNotificationCenterController

-(void)setBlursBackground:(BOOL)arg1 {
  //see if tweak is on and do a thing 
      if (kEnabled == YES) {
             NO;
   
    }

              else {
         //call original method 
        %orig;


      }


}

-(BOOL)blursBackground {
  //see if tweak is on and do a thing 
      if (kEnabled == YES) {
             return FALSE;

    }

              else {
         //call original method 
             return %orig;

      }


}
%end
	//Prefs new 
//Using libcephei instead of the old crappy way
//ws.hbang.common is your friend 

HBPreferences *preferences;
extern NSString *const HBPreferencesDidChangeNotification;

//our constructor 
%ctor {

//write to a plist file to save data from user when they toggle on or off a feature 

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ikilledappl3.ncwallcustomizer"];

      //check the bool value from the plist
	[preferences registerBool:&kEnabled default:NO forKey:@"kEnabled"];
}
