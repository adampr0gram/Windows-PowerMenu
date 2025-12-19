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
echo 5) Exit
set /p menu=Chose One: 
if %menu%==1 goto Notepad
if %menu%==2 goto Powershell
if %menu%==3 goto Web
if %menu%==4 goto Info
if %menu%==5 exit
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

