//
//  YHXSetPageViewController.m
//  iphone1
//
//  Created by Zeng Yifei on 13-3-8.
//  Copyright (c) 2013年 KaiYan. All rights reserved.
//

#import "YHXSetPageViewController.h"
#import "YHXAppDelegate.h"

@interface YHXSetPageViewController ()

@end

@implementation YHXSetPageViewController

@synthesize name;
@synthesize codeTex;
@synthesize securityExt;
@synthesize ssidExt;
@synthesize codeExt;
@synthesize defualtSecurity;
@synthesize defualtCode;
@synthesize defualtSSID;
@synthesize NewKeyIndex;
@synthesize securityLabel;
@synthesize activityIndicator;
@synthesize code1Label;
@synthesize name1Label;
@synthesize security1Label;
@synthesize state;
extern NSString* preferredLang;


-(void)getName:(NSString *)ssid andSecurity:(NSString *)security andCode:(NSString *)code;
{
    ssidExt = [[NSMutableString alloc] initWithString:ssid];
    securityExt = [[NSString alloc] initWithString:security];
    codeExt = [[NSString alloc] initWithString:code];
    
    NSLog(@"%@",securityExt);
    NSLog(@"%@",ssidExt);
    NSLog(@"%@",codeExt);
//    defualtSecurity=securityExt;
    defualtSecurity = [[NSString alloc] initWithString:securityExt];
//    defualtCode=codeExt;
    defualtCode = [[NSString alloc] initWithString:codeExt];
//    defualtSSID=ssidExt;
    defualtSSID = [[NSMutableString alloc] initWithFormat:ssidExt,nil];

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)touchDown:(id)sender;
{
    [name resignFirstResponder];
    [codeTex resignFirstResponder];
    [UIView animateWithDuration:0.3f animations:^{
        CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame = rect;}];
}

-(IBAction)switchChange
{
    if (    switchView.on == YES) {
        [UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,420,320,150)];}];         //收起来
        if ([securityExt isEqualToString:@"WEP"]&&(![defualtSecurity isEqualToString:@"WEP"])) {
            [self deallocKeys];
        }
        securityExt=defualtSecurity;                //恢复原来的加密方式
        codeExt=defualtCode;
        //ssidExt=defualtSSID;
        [ssidExt setString:defualtSSID];
        [ssidExt appendString:@"_EXT"];
        self.codeTex.userInteractionEnabled=NO;
        codeTex.backgroundColor = [UIColor grayColor];
        
        if ([preferredLang isEqualToString:@"zh-Hans"]) {
            codeTex.placeholder =@"将使用路由器密码";
        }else        codeTex.placeholder =@"Will use the router password";

        self.navigationItem.rightBarButtonItem.enabled=YES;
        codeTex.clearsContextBeforeDrawing=YES;
        codeTex.text=@"";
        securityLabel.text=securityExt;
    }else  {
        [self showTableView];
        codeTex.backgroundColor = [UIColor whiteColor];
        self.codeTex.userInteractionEnabled=YES;
        
        if ([preferredLang isEqualToString:@"zh-Hans"]) {
            codeTex.placeholder =@"请输入密码";
        }else        codeTex.placeholder =@"Please enter password ";

        if (![defualtSecurity isEqualToString:@"OFF"]) {
            self.navigationItem.rightBarButtonItem.enabled=NO;
        }
    }
    NSLog(@"%@123123",securityExt);
    //[switchView resignFirstResponder];
    
        [self touchDown:codeTex];
    
//    [name resignFirstResponder];
//    [codeTex resignFirstResponder];
//    [UIView animateWithDuration:0.3f animations:^{
//        CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
//        self.view.frame = rect;}];
}

-(void)deallocKeys
{
    [key1TextField removeFromSuperview];
    [key2TextField removeFromSuperview];
    [key3TextField removeFromSuperview];
    [key4TextField removeFromSuperview];

    [key1Label removeFromSuperview];
    [key2Label removeFromSuperview];
    [key3Label removeFromSuperview];
    [key4Label removeFromSuperview];
    
    [btn1 removeFromSuperview];
    [btn2 removeFromSuperview];
    [btn3 removeFromSuperview];
    [btn4 removeFromSuperview];
}

-(void)selectIndex1
{
    [btn1 setImage:[UIImage imageNamed:@"3.png" ]  forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    NewKeyIndex = @"1";
}

-(void)selectIndex2
{
    [btn1 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"3.png" ]  forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    NewKeyIndex = @"2";
}

-(void)selectIndex3
{
    [btn1 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"3.png" ]  forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    NewKeyIndex = @"3";
}

-(void)selectIndex4
{
    [btn1 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"3.png" ]  forState:UIControlStateNormal];
    NewKeyIndex = @"4";
}

-(void)showKeys
{
    
    btn1 = [[UIButton alloc]initWithFrame: CGRectMake(104, 273, 25, 25)];
    [btn1 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(selectIndex1) forControlEvents:UIControlEventTouchUpInside];
    
    btn2 = [[UIButton alloc]initWithFrame: CGRectMake(104, 308, 25, 25)];
    [btn2 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(selectIndex2) forControlEvents:UIControlEventTouchUpInside];
    
    btn3 = [[UIButton alloc]initWithFrame: CGRectMake(104, 343, 25, 25)];
    [btn3 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(selectIndex3) forControlEvents:UIControlEventTouchUpInside];
    
    btn4 = [[UIButton alloc]initWithFrame: CGRectMake(104, 378, 25, 25)];
    [btn4 setImage:[UIImage imageNamed:@"1.png" ]  forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(selectIndex4) forControlEvents:UIControlEventTouchUpInside];
    
    enum{
        UIControlStateNormal =0,
        UIControlStateHighlighted= 1,
    };
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];

    
    
    key1TextField = [[UITextField alloc] initWithFrame:CGRectMake(145.0f, 270.0f, 135.0f, 30.0f)];
    key2TextField = [[UITextField alloc] initWithFrame:CGRectMake(145.0f, 305.0f, 135.0f, 30.0f)];
    key3TextField = [[UITextField alloc] initWithFrame:CGRectMake(145.0f, 340.0f, 135.0f, 30.0f)];
    key4TextField = [[UITextField alloc] initWithFrame:CGRectMake(145.0f, 375.0f, 135.0f, 30.0f)];
    
    key1TextField.borderStyle =UITextBorderStyleRoundedRect;//样式设置为圆角矩形
    key2TextField.borderStyle =UITextBorderStyleRoundedRect;//样式设置为圆角矩形
    key3TextField.borderStyle =UITextBorderStyleRoundedRect;//样式设置为圆角矩形
    key4TextField.borderStyle =UITextBorderStyleRoundedRect;//样式设置为圆角矩形
    
    key1TextField.delegate=self;
    key2TextField.delegate=self;
    key3TextField.delegate=self;
    key4TextField.delegate=self;
    
    [self.view addSubview:key1TextField];
    [self.view addSubview:key2TextField];
    [self.view addSubview:key3TextField];
    [self.view addSubview:key4TextField];
    
    key1Label = [[UILabel alloc] initWithFrame:CGRectMake(34, 270, 70, 30)];;
    key2Label = [[UILabel alloc] initWithFrame:CGRectMake(34, 305, 70, 30)];;
    key3Label = [[UILabel alloc] initWithFrame:CGRectMake(34, 340, 70, 30)];;
    key4Label = [[UILabel alloc] initWithFrame:CGRectMake(34, 375, 70, 30)];;
    
    if ([preferredLang isEqualToString:@"zh-Hans"]) {
        key1Label.text = @"密钥1：";
        key2Label.text = @"密钥2：";
        key3Label.text = @"密钥3：";
        key4Label.text = @"密钥4：";
    }else{
    
        key1Label.text = @"Key1：";
        key2Label.text = @"Key2：";
        key3Label.text = @"Key3：";
        key4Label.text = @"Key4：";
    }

    key1Label.backgroundColor = [UIColor clearColor];
    key2Label.backgroundColor = [UIColor clearColor];
    key3Label.backgroundColor = [UIColor clearColor];
    key4Label.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:key1Label];
    [self.view addSubview:key2Label];
    [self.view addSubview:key3Label];
    [self.view addSubview:key4Label];
}

-(void)showTableView
{
    dataArray1 = [[NSMutableArray alloc]initWithObjects:@"OFF",@"WEP",@"WPA2-PSK-AES",@"WPA/WPA2-PSK", nil];
    
    DataTable = [[UITableView alloc]initWithFrame:CGRectMake(0,420,320,150)];    //初始化tableview
    DataTable.delegate = self;      //指定委托
    DataTable.dataSource = self;    //指定数据委托
    DataTable.separatorColor = [UIColor lightGrayColor];    //设置间隔颜色
    [UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,270,320,150)];}];         //从底下冒出
    [self.view addSubview:DataTable];                       //加载tableview
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    switchView.on = NO;
    
    if (cell!=nil) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    securityExt = [dataArray1 objectAtIndex:indexPath.row];
    NSLog(@"%@secu  %@",securityExt,defualtSecurity);
    
    if ([securityExt isEqualToString:@"WEP"]) {
        
        
        
        [UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,420,320,150)];}           //收起来
         completion:^(BOOL finished) {
             if ((![defualtSecurity isEqualToString:@"WEP"])) {
                 [self showKeys];
             }
         } ];
        self.navigationItem.rightBarButtonItem.enabled=NO;
        codeTex.userInteractionEnabled=NO;
        codeTex.backgroundColor = [UIColor grayColor];
        if ([preferredLang isEqualToString:@"zh-Hans"]) {
            codeTex.placeholder = @"请输入密钥";
        }else         codeTex.placeholder = @"Enter key ";


    }else if ([securityExt isEqualToString:@"OFF"]){
        self.navigationItem.rightBarButtonItem.enabled=YES;
        codeTex.userInteractionEnabled=NO;
        codeTex.backgroundColor = [UIColor grayColor];
        if ([preferredLang isEqualToString:@"zh-Hans"]) {
            codeTex.placeholder = @"无需输入密钥";
        }else         codeTex.placeholder = @"Don't need to enter a password";        //[UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,420,320,150)];}];
    }else if([securityExt rangeOfString:@"WPA"].length>0){
        self.navigationItem.rightBarButtonItem.enabled=NO;
        codeTex.userInteractionEnabled=YES;
        codeTex.backgroundColor = [UIColor whiteColor];
        if ([preferredLang isEqualToString:@"zh-Hans"]) {
            codeTex.placeholder = @"请输入密码";
        }else         codeTex.placeholder = @"Enter password";
        //[UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,420,320,150)];}];
    }
    securityLabel.text=securityExt;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray1 count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  //绘制Cell
{
    static NSString * CellIdentifier = @"Cell";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell1 == nil) {
        cell1= [[[UITableViewCell alloc]initWithFrame:CGRectZero]autorelease];
    }
    [[cell1 textLabel]  setText:[dataArray1 objectAtIndex:indexPath.row]];//给cell添加数据
    
    
    
    return cell1;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType =UIReturnKeyDone;//return键变成什么键
    
    [UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,420,320,150)];}];           //收起来

    
    if ([securityExt isEqualToString:@"WEP"]&&(textField.tag!=1)) //WEP有密钥 得高点
                {
                    [UIView animateWithDuration:0.3f animations:^{
                     CGRect rect = CGRectMake(0, -205, self.view.frame.size.width, self.view.frame.size.height);
                        self.view.frame=rect;}];
                }
    else{
    
    [UIView animateWithDuration:0.3f animations:^{
        CGRect rect = CGRectMake(0, -66, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame=rect;}];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (![name.text isEqualToString:@""]) {
        [ssidExt setString:name.text];
        NSLog( @"ss%@ss",ssidExt);
    }else name.text=ssidExt;
    if (![codeTex.text isEqualToString:@""]) {
        codeExt=codeTex.text;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView animateWithDuration:0.3f animations:^{
        CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame = rect;}];
    if (![codeTex.text isEqualToString:@""]) {
        self.navigationItem.rightBarButtonItem.enabled=YES;
    }
    else if([securityExt isEqualToString:@"WEP"])
    {
        if ([NewKeyIndex isEqualToString:@"1"]&&(![key1TextField.text isEqualToString:@""])) {
            self.navigationItem.rightBarButtonItem.enabled=YES;
        }else if ([NewKeyIndex isEqualToString:@"2"]&&(![key2TextField.text isEqualToString:@""])) {
            self.navigationItem.rightBarButtonItem.enabled=YES;
        }else if ([NewKeyIndex isEqualToString:@"3"]&&(![key3TextField.text isEqualToString:@""])) {
            self.navigationItem.rightBarButtonItem.enabled=YES;
        }else if ([NewKeyIndex isEqualToString:@"4"]&&(![key4TextField.text isEqualToString:@""])) {
            self.navigationItem.rightBarButtonItem.enabled=YES;
        }
    }
    else if(switchView.on==NO&& ![securityExt isEqualToString:@"OFF"])    { self.navigationItem.rightBarButtonItem.enabled=NO;}
    [textField resignFirstResponder];
    
    NSLog(@"%@ 11 %@ 22 %@",securityExt,NewKeyIndex,key1TextField.text);
    return YES;
}

-(int)Done
{
    if (codeExt.length<8) {
        
        if ([preferredLang isEqualToString:@"zh-Hans"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"输入密码错误"
                                                            message:[NSString stringWithFormat:@"密码需要大于等于8位！"]
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
        }else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed to enter the password"
                                                            message:[NSString stringWithFormat:@"Please make sure the password is more than 7 characters"]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        self.navigationItem.rightBarButtonItem.enabled=NO;
        return 0;
    }

    
    NSString * newRadio= @"2.4G";
    NSString * Auto= @"Auto";
    
    NSString * NewWEPLength = @"64";

    activityIndicator = [[UIActivityIndicatorView alloc]init];
    [activityIndicator setCenter:CGPointMake(160,250)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityIndicator];
    
    if ([activityIndicator isAnimating]) {
        [activityIndicator stopAnimating];
    }
    [activityIndicator startAnimating];
    
    if (![name.text isEqualToString:@""]) {
        [ssidExt setString:name.text];
    }
    
    if ([securityExt rangeOfString:@"OFF"].length>0) {
        [soap SetWLANNoSecurity:newRadio :ssidExt :Auto :Auto];
        
    }else if ([securityExt rangeOfString:@"WEP"].length>0) {
        [soap SetWLANWEPByKeys:newRadio :ssidExt :Auto :Auto :Auto :NewWEPLength :NewKeyIndex :key1TextField.text :key2TextField.text :key3TextField.text :key4TextField.text];
        
    }else if ([securityExt rangeOfString:@"WPA"].length>0) {
        [soap SetWLANWPAPSKByPassphrase:newRadio :ssidExt :Auto :Auto :securityExt :codeExt];
        NSLog(@"密码 %@",codeExt);
        NSLog(@"名字 %@",ssidExt);
    }
    [UIView animateWithDuration:0.2 animations:^{[DataTable setFrame:CGRectMake(0,420,320,150)];}];           //收起来
    [self touchDown:codeTex];//  收键盘
    return 0;
}

-(void)finishAndSetEnable:(NSNotification *)note
{
    [soap ConfigurationFinished];
//    [soap SetEnable];                                               //
//    NSLog(@"enable coming");
}

-(void)setenable:(NSNotification *)note                             //
{
    [soap SetEnable];
    NSLog(@"enable coming");
}

-(void)enabled:(NSNotification *)note
{
    NSLog(@"enabled…………");
    if ([activityIndicator isAnimating]) {
        [activityIndicator stopAnimating];
    }
}

- (void)viewDidLoad
{
    soap = [[YHXSoapAPI alloc]init];

    if ([securityExt isEqualToString:@"WEP"]) {
        [self showKeys];
    }
    securityLabel.text=securityExt;
    
    name.tag=1;
    
    //NSLog(@"%@ load",ssidExt);

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishAndSetEnable:) name:@"SetWLAN" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setenable:) name:@"ConfigurationFinished" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enabled:) name:@"SetEnable" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exit) name:@"close" object:nil];

    name.clearsOnBeginEditing =YES;//下次编辑时清除内容；
    name.delegate =self;//设置代理用于实现协议
    name.keyboardType=UIKeyboardAppearanceAlert;
    
    [ssidExt appendString:@"_EXT"];
    name.text=ssidExt;

    self.codeTex.userInteractionEnabled=NO;
    codeTex.backgroundColor = [UIColor grayColor];
    codeTex.clearsOnBeginEditing =YES;//下次编辑时清除内容；
    codeTex.delegate =self;//设置代理用于实现协议
    codeTex.keyboardType=UIKeyboardAppearanceAlert;

    
    
    
    if ([preferredLang isEqualToString:@"zh-Hans"]) {
        name.placeholder =@"请输入名称";

        codeTex.placeholder =@"将使用路由器密码";

        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonSystemItemTrash  target:self action:@selector(Done)];
        self.navigationItem.rightBarButtonItem = buttonItem;
    }else{
    
        name.placeholder =@"Please enter the name";
        
        codeTex.placeholder =@"Will use the router password";
        
        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonSystemItemTrash  target:self action:@selector(Done)];
        self.navigationItem.rightBarButtonItem = buttonItem;
        name1Label.text=@"SSID";
        security1Label.text=@"Safe mode";
        code1Label.text=@"Passphrase";
        state.text=@"Use the same as the existing network encryption and password";
    }
    
    
    
    switchView.on = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)exit
{
    [self performSelector:@selector(exited) withObject:nil afterDelay:2];
    
    if ([activityIndicator isAnimating]) {
        [activityIndicator stopAnimating];
    }
    [activityIndicator setCenter:CGPointMake(160,250)];
    [activityIndicator startAnimating];
    
    UILabel * notification = [[UILabel alloc]init];
    notification.frame=CGRectMake(120, 150, 120,30);
    [self.view addSubview:notification];
    notification.backgroundColor=[UIColor clearColor];
    
    if ([preferredLang isEqualToString:@"zh-Hans"]) {
        notification.text=@"关闭中…";

    }else {
        notification.text=@"Closeing…";
    }
    notification.alpha=0;
    
    [UIView animateWithDuration:0.5f animations:^{    name1Label.alpha=0; notification.alpha=1;
        name.alpha=0;security1Label.alpha=0;securityLabel.alpha=0;state.alpha=0;code1Label.alpha=0;codeTex.alpha=0;
        switchView.alpha=0;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5f animations:^{    name1Label.alpha=0;
            self.view.alpha=0;
        }];
    }];
;
    
}

-(void)exited
{
    exit(0);
}

-(void)dealloc
{
    [defualtCode release];
    [defualtSecurity release];
    [defualtSSID release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
