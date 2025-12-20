@echo off
title Windows Powermenu
if %errorlevel%==1 goto error
goto start
:error
echo sorry but there has been a error press enter to exit
pause
exit
:start
echo Hello and welcome to Windows Powermenu
echo 1) GUI
echo 2) Menu
set /p opti=Would you like a GUI or a Menu: 
if %opti%==1 goto GUI
if %opti%==2 goto Menu
if %errorlevel%==1 goto error
:Menu
cls
echo You have chose the Menu These are your options
echo 1) Open Notepad
echo 2) Run Powershell
echo 3) Open A Broswer
echo 4) Computer Info
echo 5) Play Snake
echo 6) Exit
set /p menu=Chose One: 
if %menu%==1 goto Notepad
if %menu%==2 goto Powershell
if %menu%==3 goto Web
if %menu%==4 goto Info
if %menu%==5 goto snake
if %menu%==6 exit
:Notepad
C:\Windows\System32\notepad.exe
goto menu
:Powershell
cls
set /p power=Whats your cmd: 
powershell -NoProfile -ExecutionPolicy Bypass -Command "%power%"
echo.
echo.
pause
goto menu
:GUI
powershell -Command "Add-Type -ReferencedAssemblies 'System.Windows.Forms','System.Drawing','Microsoft.VisualBasic' -TypeDefinition 'using System;using System.Windows.Forms;using System.Drawing;using System.Diagnostics;using Microsoft.VisualBasic;public class Win{public static void Run(){Form f=new Form{Text=\"System Tasks\",Size=new Size(400,280),BackColor=Color.FromArgb(240,240,240),ForeColor=Color.Black,FormBorderStyle=FormBorderStyle.FixedSingle,StartPosition=FormStartPosition.CenterScreen,MaximizeBox=false};Label h=new Label{Text=\"Choose an action below:\",Location=new Point(15,15),Size=new Size(350,20),Font=new Font(\"Segoe UI\",9,FontStyle.Bold)};Label m=new Label{Text=\"1: Notepad  ^|  2: PowerShell  ^|  3: Info  ^|  4: Web\",Location=new Point(15,40),Size=new Size(350,20),Font=new Font(\"Segoe UI\",8),ForeColor=Color.Gray};TextBox t=new TextBox{Location=new Point(15,80),Width=350,BackColor=Color.White,ForeColor=Color.Black,BorderStyle=BorderStyle.FixedSingle,Font=new Font(\"Segoe UI\",10)};Button b=new Button{Text=\"Run\",Location=new Point(275,120),Width=90,Height=30,FlatStyle=FlatStyle.System,Font=new Font(\"Segoe UI\",9)};b.Click+=(s,e)=>{string i=t.Text;if(i==\"1\"){Process.Start(\"notepad.exe\");}else if(i==\"2\"){string p=Interaction.InputBox(\"Enter PS Command:\",\"PS Exec\");if(!string.IsNullOrEmpty(p))Process.Start(\"powershell.exe\",\"-NoExit -Command \"+p);}else if(i==\"3\"){MessageBox.Show(\"User: \"+Environment.UserName+\"\nHost: \"+Environment.MachineName,\"System Info\");}else if(i==\"4\"){Process.Start(\"https://www.google.com\");}else{MessageBox.Show(\"Invalid selection\");}};f.Controls.AddRange(new Control[]{h,m,t,b});f.ShowDialog();}}'; [Win]::Run()"
cls
goto start
:Web
start https://google.com
cls
goto Menu
:Info
cls
echo User: %username% & echo PC:   %computername% & ver
pause
goto Menu
:snake
cls
powershell -Command "Add-Type -TypeDefinition 'using System;using System.Threading;public class S{const int H=20,W=40;int[] tx=new int[200],ty=new int[200];int tl=0,sc,x,y,fx,fy,dir=2;bool g;Random r=new Random();void I(){if(!Console.KeyAvailable)return;var k=Console.ReadKey(true).Key;if((k==ConsoleKey.LeftArrow||k==ConsoleKey.A)&&dir!=2)dir=1;if((k==ConsoleKey.RightArrow||k==ConsoleKey.D)&&dir!=1)dir=2;if((k==ConsoleKey.UpArrow||k==ConsoleKey.W)&&dir!=4)dir=3;if((k==ConsoleKey.DownArrow||k==ConsoleKey.S)&&dir!=3)dir=4;if(k==ConsoleKey.X)g=true;}void D(){Console.SetCursorPosition(0,0);Console.WriteLine(new string(''-'',W+2));for(int i=0;i<H;i++){for(int j=0;j<=W;j++){if(j==0||j==W)Console.Write(''#'');else if(i==y&&j==x)Console.Write(''O'');else if(i==fy&&j==fx)Console.Write(''*'');else{bool b=false;for(int n=0;n<tl;n++)if(tx[n]==j&&ty[n]==i){Console.Write(''o'');b=true;break;}if(!b)Console.Write('' '');}}Console.WriteLine();}Console.WriteLine(new string(''-'',W+2));Console.WriteLine(\"Score: \"+sc+\"  Arrows/WASD  X Quit\");}void L(){int px=tx[0],py=ty[0],px2,py2;tx[0]=x;ty[0]=y;for(int i=1;i<tl;i++){px2=tx[i];py2=ty[i];tx[i]=px;ty[i]=py;px=px2;py=py2;}if(dir==1)x--;if(dir==2)x++;if(dir==3)y--;if(dir==4)y++;if(x<=0||x>=W||y<0||y>=H)g=true;for(int i=0;i<tl;i++)if(tx[i]==x&&ty[i]==y)g=true;if(x==fx&&y==fy){sc+=10;tl++;fx=r.Next(1,W-1);fy=r.Next(1,H-1);}}public static void Run(){var s=new S();s.x=W/2;s.y=H/2;s.fx=s.r.Next(1,W-1);s.fy=s.r.Next(1,H-1);Console.CursorVisible=false;while(!s.g){s.D();s.I();s.L();Thread.Sleep(90);}}}';[S]::Run()"
if %errorlevel%==1 goto snake2
:snake2
VERIFY > nul
cls
Echo you have died would you like to try again or goto menu
echo.
echo 1) Play again
echo 2) Goto Menu
set /p snake=Chose One: 
if %snake%==1 goto Snake
if %snake%==2 goto Menu