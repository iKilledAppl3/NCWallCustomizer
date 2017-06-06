
#import "../NCWallCustomizer.h"

/*@interface NCWallCustomizer: HBListController {
}

@end
*/

#define ncImagePath @"/Library/Application Support/NCWallCustomizer/ncwallcustomizer.png"
static NSString *imgPath = @"/var/mobile/Documents/";
//static NSString *usrNCImg = @"/var/mobile/Documents/ncwall.png";

@implementation NCWallCustomizerListController
+ (NSString *)hb_specifierPlist {
	return @"NCWallCustomizer";
	
}


+ (UIColor *)hb_tintColor {
	return [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
}

-(void)loadView {
    [super loadView];

self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];

	
}


- (void)shareTapped {
    NSString *text = [NSString stringWithFormat:@"I customized my Notification Center background using NCWallCustomizer by @iKilledAppl3! Download in Cydia for free!"];

  UIImage *image = [UIImage imageWithContentsOfFile:ncImagePath];
    NSArray * itemsToShare = @[text, image];
    
    if ([UIActivityViewController alloc]) {
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        [(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
    }else {
        //awesomeness
    }
}
-(void)respring {

	//Added the sysVersion stuff because of iPhone 7 & 7+ issues on auto respring with backboardd
if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,0}]){
	system ("killall -9 SpringBoard");
}

if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,0,1}]){
	system ("killall -9 SpringBoard");
}

if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){.majorVersion = 10, .minorVersion = 1, .patchVersion = 0}]) {
	system ("killall -9 SpringBoard");
}

if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,1,1}]){
	system ("killall -9 SpringBoard");
}

else {
	system ("killall -9 backboardd");	
}
    
}

-(void)imgFileSysCheck {
        
        UIAlertView *imgAlert = [[UIAlertView alloc] initWithTitle:@"NCWallCustomizer"
                                                        message:@"No Image Found! Please Set an image for the Notification Center!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [imgAlert show];
        [imgAlert release];
		
	   UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                          imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          imagePicker.delegate = self;
                                          imagePicker.allowsEditing = YES;
                                          [self presentViewController:imagePicker animated:YES completion:nil];	
}

-(void)doesImageExist {
        
        UIAlertView *imgAlert = [[UIAlertView alloc] initWithTitle:@"NCWallCustomizer"
                                                        message:@"No Image Found! Please Set an image for the Notification Center!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [imgAlert show];
        [imgAlert release];
		
	   UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                          imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          imagePicker.delegate = self;
                                          imagePicker.allowsEditing = NO;
                                          [self presentViewController:imagePicker animated:YES completion:nil];	
 }

-(void)imagePicked {
        
        UIAlertController *view =  [UIAlertController
                                    alertControllerWithTitle:@"Image Options"
                                    message:@"Choose what you want below"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* crop = [UIAlertAction
                                      actionWithTitle:@"Crop"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action)
                                      {
                                          NSString *pathForImage = [imgPath stringByAppendingPathComponent:@"ncwall.png"];

			 if (![[NSFileManager defaultManager] fileExistsAtPath:pathForImage]) {
				 
				 
				 [self performSelector:@selector(imgFileSysCheck) withObject:nil];
				 
				 }	 else  {
					
										  
                                          UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                          imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          imagePicker.delegate = self;
                                          imagePicker.allowsEditing = YES;
                                          [self presentViewController:imagePicker animated:YES completion:nil];
				}						  
                                          
                                      }];
        
        UIAlertAction* noCrop = [UIAlertAction
                                            actionWithTitle:@"No Crop"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action)
                                            {
                                                
			  NSString *pathForImage = [imgPath stringByAppendingPathComponent:@"ncwall.png"];

			 if (![[NSFileManager defaultManager] fileExistsAtPath:pathForImage]) {
				 
				 [self performSelector:@selector(doesImageExist) withObject:nil];
				 
				 }	
				
				
				 else  {
					
					 

                                                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                                imagePicker.delegate = self;
                                                imagePicker.allowsEditing = NO;
                                                [self presentViewController:imagePicker animated:YES completion:nil];
				}
                                            }];
        
        
        
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleCancel
                                 handler:^(UIAlertAction * action)
                                 {
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        
        [view addAction:crop];
        [view addAction:noCrop];
        [view addAction:cancel];
        [self presentViewController:view animated:YES completion:nil];
        
       


        
    }
        
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirDoc = [paths objectAtIndex:0];
    NSString *path = [dirDoc stringByAppendingPathComponent:@"ncwall.png"];
     NSData *dataToWrite = UIImagePNGRepresentation(picture);
     [dataToWrite writeToFile:path atomically:YES];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NCWallCustomizer"
                                                       message:@"Error while saving the image to the filesystem! Try Again!"
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        [alert release];
		
		//Force the file to write to the path we specified even if it throws an error!
		//Using this method
		[[NSFileManager defaultManager] createFileAtPath:dirDoc contents:nil attributes:nil];
		
		
     [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        UIAlertView *alertUser = [[UIAlertView alloc] initWithTitle:@"NCWallCustomizer"
			message:@"Success the image has been saved! Your Device Will Respring!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertUser show];
        [alertUser release];



    [imagePicker release];
   [self dismissViewControllerAnimated:YES completion:nil];
   [self performSelector:@selector(respring) withObject:nil afterDelay:2.0];
        

    }
    
    else if (picture == nil) {
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                        message:@"There was an error while retrieving the image!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        [error release];

      
    }
	
	
    
	
	else {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [imagePicker release];
		
    
}


}


-(void)removeNCImage {
    
    NSString *photoPath = [imgPath stringByAppendingPathComponent:@"ncwall.png"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:photoPath]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NCWallCustomizer"
			message:@"The image has been removed."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        	   	  NSFileManager *fileManager = [[NSFileManager alloc] init];
		  [fileManager removeItemAtPath:photoPath error:nil];		  
        //[[NSFileManager defaultManager] removeItemAtPath:photoPath error:nil];
    }
    
    else if
        (![[NSFileManager defaultManager] fileExistsAtPath:photoPath]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NCWallCustomizer"
                                                            message:@"Error! Can't remove the file or it doesn't exist!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
            else {
               NSString *photoPath = [imgPath stringByAppendingPathComponent:@"ncwall.png"];
             	  NSFileManager *fileManager = [[NSFileManager alloc] init];
	  [fileManager removeItemAtPath:photoPath error:nil];	  
	//[[NSFileManager defaultManager] removeItemAtPath:photoPath error:nil];

            }
    
}

@end
// vim:ft=objc
