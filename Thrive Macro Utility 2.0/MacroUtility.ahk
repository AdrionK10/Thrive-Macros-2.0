#SingleInstance, force
Genus = 
Species = 
Cultivar = 
Loc = 
Stat = 
Seas = 
Prio = 
ToA =1
NSA =0
nVar =0
OrderNumVal =1
NoSellCalc =0.06
ARD =01012022
TotalCommands =
PixelOffset = 20
StringSearch =Null
Seconds = 4000
Targets =%A_WorkingDir%\Targets\
LastFunction =---
toggle =0
toggle2 =0
FunctionLogKey =--- 
MultiFile =%A_WorkingDir%\MultiFile.ini


if FileExist("H:\tmu\Settings.ini")
{
IniRead, TotalCommands, H:\tmu\Settings.ini,MacroCount,Total
IniRead, Seconds, H:\tmu\Settings.ini,WaitTime,Sec
IniRead, PixelOffset, H:\tmu\Settings.ini,PixelOffset,Pixels
IniRead, NoSellCalc, H:\tmu\Settings.ini,Calc,Percent
IniRead, ARD, H:\tmu\Settings.ini,ARD,Date
IniRead, Genus, H:\tmu\Settings.ini,Genus,Ge
IniRead, Species, H:\tmu\Settings.ini,Species,Sp
IniRead, Cultivar, H:\tmu\Settings.ini,Cultivar,Cu
IniRead, Location, H:\tmu\Settings.ini,Location,Lo
IniRead, Prio, H:\tmu\Settings.ini,Priority,Pr
IniRead, Seas, H:\tmu\Settings.ini,Season,Se
IniRead, Stat, H:\tmu\Settings.ini,Status,St
}
;----------------------------------------------------------------------BEGIN GUI

Goto, Init

Init:
Suspend, Off
GuiWidth := 285
Guixpos := A_ScreenWidth - GuiWidth - 10
Gui, New, 
Gui, +AlwaysOnTop
Gui, -Border
Gui, Color, Black
Gui, Show, x%Guixpos% y10  h75 w%GuiWidth% , MAIN
Gui, Font, s10 cWhite
Gui, Add, Text, x15 y5, Thrive Macro
Gui, Add, Button, x15 y30 w50 h33 gFnMenu,Hot Keys
Gui, Add, Button, x85 y30 w50 h33 gUtilityMenu,Utility
Gui, Add, Button, x155 y30 w50 h33 gReload,Cancel
Gui, Add, Button, x225 y30 w50 h33 gExit,Exit
Gui, Font, s10
Gui, Add, Text, x115 y5 cyellow, HotKeys Active
return


Cancel:
Suspend, On
Goto, Init
return

Reload:
FileCreateDir, H:\tmu\
IniWrite,%Genus%, H:\tmu\Settings.ini,Genus,Ge
IniWrite,%Species%, H:\tmu\Settings.ini,Species,Sp
IniWrite,%Cultivar%, H:\tmu\Settings.ini,Cultivar,Cu
IniWrite,%Location%, H:\tmu\Settings.ini,Location,Lo
IniWrite,%Prio%, H:\tmu\Settings.ini,Priority,Pr
IniWrite,%Seas%, H:\tmu\Settings.ini,Season,Se
IniWrite,%Stat%, H:\tmu\Settings.ini,Status,St
IniWrite,%TotalCommands%, H:\tmu\Settings.ini, MacroCount,Total
IniWrite,%Seconds%, H:\tmu\Settings.ini,WaitTime,Sec
IniWrite,%PixelOffset%, H:\tmu\Settings.ini, PixelOffset,Pixels
IniWrite,%NoSellCalc%, H:\tmu\Settings.ini,Calc,Percent
IniWrite,%ARD%, H:\tmu\Settings.ini,ARD,Date
Reload
Sleep 500 ; 
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return


UtilityMenu:

if(toggle2 = 1)
{
Gui, 1:Destroy,
toggle2--
return
}
if(toggle2 = 0)
{
GuiWidth := 215
Guixpos := A_ScreenWidth - GuiWidth - 10
Gui, 1:New,
Gui, Font, s15 caqua
Gui, Add, Text, x10 y20,Genus
Gui, Add, Text, x105 y20,Species 
Gui, Add, Text, x10 y80,Cultivar  
Gui, Add, Text, x105 y80,Season
Gui, Font, s13
Gui, Add, Text, x10 y140,Status(5) 
Gui, Font, s15 
Gui, Add, Text, x105 y140,Priority  
Gui, Add, Text, x10 y200,Location
Gui, Font, s15 cblack
Gui, Add, Edit, x10  y45  w70 vGenus    Uppercase
Gui, Add, Edit, x105 y45  w70 vSpecies  Uppercase      
Gui, Add, Edit, x10  y105 w70 vCultivar Uppercase 
Gui, Add, Edit, x105 y105 w70 vSeas     Uppercase          
Gui, Add, Edit, x10  y165 w70 vStat     Uppercase 
Gui, Add, Edit, x105 y165 w70 vPrio     Uppercase
Gui, Add, Edit, x10  y225 w95 vLoc      Uppercase
Gui, Font, s20 cwhite
Gui, Add, Text, cwhite x10 y260,_____________
Gui, Add, Text, cwhite x10 y355,_____________
Gui, Add, Text, cwhite x10 y290,Current Setting
Gui, Font, s8 cred
Gui, Add, Text, x10 w200 y330 vL1, 
Gui, Add, Text, x10 w200 y345 vL2, 
Gui, Add, Text, x10 w200 y360 vL3, 
Gui, Add, Button, x125 y225 w50 h33 gUpdateVars, Update
Gui, Font, s10
Gui, Add, Text, cwhite x10 y395,Last Command
Gui, Font, s8 cred
Gui, Add, Text, x10 w250 y415 vL4, 
Gui, Add, Text, cwhite x10 y420,_____________
Gui, Font, s10
Gui, Add, Text, cwhite x10 y435,# of Macros Used
Gui, Font, s8 cred
Gui, Add, Text, x10 w250 y455 vL5, 
Gui, Add, Text, cwhite x10 y460,_____________
Gui, -Border 
Gui, +AlwaysOnTop
Gui, Color, Black
Gui, Show, x%Guixpos% y100 w%GuiWidth% , TRANSFER UTILITY
WinSet, Transparent, 200, TRANSFER UTILITY
toggle2++
TotalCommands--
LastFunction = Opened Utility Menu
Goto, UpdateLastFn
return
}

UpdateVars:
Gui, Submit, NoHide

GuiControl,,L1, %Genus% - %Species% - %Cultivar%
GuiControl,,L2, Season:%Seas% Status:%Stat%
GuiControl,,L3,Location:%Loc% Priority:%Prio%
GuiControl,,Genus,%Genus%
GuiControl,,Species,%Species%
GuiControl,,Cultivar,%Cultivar%
GuiControl,,Seas,%Seas%
GuiControl,,Stat,%Stat%
GuiControl,,Prio,%Prio%
GuiControl,,Loc,%Loc%
LastFunction = Updated all Variables
Goto, UpdateLastFn
return


UpdateLastFn:
TotalCommands++
GuiControl,,L1, %Genus% - %Species% - %Cultivar%
GuiControl,,L2, Season:%Seas% Status:%Stat%
GuiControl,,L3,Location:%Loc% Priority:%Prio%
GuiControl,,L4, %LastFunction%
GuiControl,,L5, %TotalCommands%
GuiControl,,Genus,%Genus%
GuiControl,,Species,%Species%
GuiControl,,Cultivar,%Cultivar%
GuiControl,,Seas,%Seas%
GuiControl,,Stat,%Stat%
GuiControl,,Prio,%Prio%
GuiControl,,Loc,%Loc%
FormatTime, CurrentDateTime,, MM/dd/yy
FormatTime, HoursSeconds,, HH:mm:ss
IniWrite, %LastFunction%, %A_WorkingDir%\Log.txt,%CurrentDateTime%, User: %A_Username% -- Reference #%TotalCommands%   %HoursSeconds% -------            
return



GuiClose:
	Gui, Destroy,
	Return





Exit:
FileCreateDir, H:\tmu\
IniWrite,%Genus%, H:\tmu\Settings.ini,Genus,Ge
IniWrite,%Species%, H:\tmu\Settings.ini,Species,Sp
IniWrite,%Cultivar%, H:\tmu\Settings.ini,Cultivar,Cu
IniWrite,%Location%, H:\tmu\Settings.ini,Location,Lo
IniWrite,%Prio%, H:\tmu\Settings.ini,Priority,Pr
IniWrite,%Seas%, H:\tmu\Settings.ini,Season,Se
IniWrite,%Stat%, H:\tmu\Settings.ini,Status,St
IniWrite,%TotalCommands%, H:\tmu\Settings.ini, MacroCount,Total
IniWrite,%Seconds%, H:\tmu\Settings.ini,WaitTime,Sec
IniWrite,%PixelOffset%, H:\tmu\Settings.ini, PixelOffset,Pixels
IniWrite,%NoSellCalc%, H:\tmu\Settings.ini,Calc,Percent
IniWrite,%ARD%, H:\tmu\Settings.ini,ARD,Date
ExitApp








FnMenu:
if(toggle = 1)
{
Gui, 2:Destroy,
toggle--
return
}
if(toggle = 0)
{
GuiWidth := 600

Guixpos := A_ScreenWidth - GuiWidth - 240
Gui, 2:New, 
Gui, +AlwaysOnTop
Gui, -Border
Gui, Color, Black
Gui, Show, x%Guixpos% y100 h270 w%GuiWidth% , KEY INFO
WinSet, Transparent, 200, KEY INFO
Gui, Font, s10 cyellow
Gui, Add, Text,x10 y5,(Alt+N) = Fill New Loc 
Gui, Add, Text,x300 y5,(Alt+Comma) = Print and Apply
Gui, Add, Text,x10 y35,(Alt+1) = Set Location, Status, Season
Gui, Add, Text,x300 y35,(Alt+2) = Set Status, Season
Gui, Add, Text,x10 y65,(Alt+3) = Set Clicker Pixel Offset
Gui, Add, Text,x300 y65,(Alt+4) = Set Gen,Spec,Cult
Gui, Add, Text,x10 y95,(Alt+5) = Set Wait Time
Gui, Add, Text,x300 y95,(Alt+A) = Quick Search
Gui, Add, Text,x10 y125,(Alt+T) = Fast Trifecta
Gui, Add, Text,x300 y125,(Alt+M) = AutoFill-Master
Gui, Add, Text,x10 y155,(Alt+L) = AutoFill-Location
Gui, Add, Text,x300 y155,(NUM/)  = AutoFill-Transfer
Gui, Add, Text,x10 y185,(SHIFT+/) = Quick Genus,Species,Cultivar
Gui, Add, Text,x300 y185,(SHIFT+Period) = Place Status, Location
Gui, Add, Text,x10 y215,(ALT+7) = Change NoSell Percent and ARD
Gui, Add, Text,x300 y215,(ALT+X) = Multi Location (Defined By MultiFile.ini)
Gui, Add, Text,x10 y245,(ALT+B) = Save Snapshots of Order Balances By order Numbers Defined in (OrderNums.txt)
toggle++
return
}







;----------------------------------------------------------------------END GUI



^i::

CoordMode, Pixel, Screen 
CoordMode, Mouse, Screen
InputBox, Genus, Genus, Input Genus,
InputBox, Species, Species, Input Species,
InputBox, Cultivar, Cultivar, Input Cultivar,
InputBox, Loc, Location, Location (No Spaces):,
InputBox, Stat, Status, Type Status (5 Char Min (Use Spaces if Need)):,
InputBox, Seas, Season, What Season:,
InputBox, Prio, Priority, What Priority:,
LastFunction = (Alt-i) Initialize Variables
Goto, UpdateLastFn
return




!1::
InputBox, Loc, Location, Location (No Spaces):,
InputBox, Stat, Status, Type Status (5 Char Min (Use Spaces if Need)):,
InputBox, Seas, Season, What Season:,
InputBox, Prio, Priority, What Priority:,
LastFunction = (Alt-1) Set Location, Status, Season
Goto, UpdateLastFn
return

!2::
InputBox, Stat, Status, Current Status:%Stat%,
InputBox, Seas, Season, Current Season: %Seas%,
LastFunction = (Alt-2) Set Status, Season
Goto, UpdateLastFn
return

!3::
InputBox, PixelOffset, Pixel-Offset, Current Offset: %PixelOffset%,
LastFunction = (Alt-3) Set Y - Offset for ImageSearch
Goto, UpdateLastFn
return

!4::
InputBox, Genus, Genus, Current Genus: %Genus%,
InputBox, Species, Species, Current Species: %Species%,
InputBox, Cultivar, Cultivar, Current Cultivar: %Cultivar%,
LastFunction = (Alt-4) Set Genus, Species, Cultivar
Goto, UpdateLastFn
return

!5::
InputBox, Seconds, Second Delay, Current Seconds to Delay: %Seconds%,
Seconds := Seconds*1000 ;
LastFunction = (Alt-5) Set Second Delay On Print Feature
Goto, UpdateLastFn
return

!a::
InputBox, StringSearch, Search, Item to Search:,
send, %StringSearch%
LastFunction = (Alt-a) Quick Type / Search Function (%StringSearch%)
Goto, UpdateLastFn
return

NumpadDiv::
InputBox, ToA, Total, Input # to Transfer,
InputBox, NSA, NoSell, Total NoSell,
send,%Loc%`t
send,%Stat%
send,%Seas%`t
send,%Prio%`t
send,`t`t%ToA%`t`t`t`t`t`t`t`t%NSA%`t
send,`t`t{Enter}{Enter}{Enter}
sleep, 1500 ; 
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%ItemCode.png
cY += PixelOffset
cX += 50
SendEvent {Click, %cX% %cY% Right}
LastFunction = (NUM-/) Quick Inventory Transfer             ||Transferred|| Onhand: %ToA% | NoSell: %NSA% | Location: %Loc% | Season: %Seas% |
Goto, UpdateLastFn
return		

!m::
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%MasStart.png
cY -= PixelOffset ;
cX += 50
SendEvent {Click, %cX% %cY%}
send,`t`t`t
send,%Genus%`t%Genus%
send,`t%Species%`t%Species%
send,`t%Cultivar%`t%Cultivar%

send,`t`t`t`t`t`t`t
send,^a%Seas%`t^a%Seas%


send,{Enter}
sleep, %Seconds% ; 
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
SendEvent {Click, %cX% %cY%}
send,{Enter}
LastFunction = (Alt-m) Quickfill & Print Master
Goto, UpdateLastFn
return		


!l::
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%LocStart.png

cX += 20
SendEvent {Click, %cX% %cY%}
send,`t^a%Loc%`t^a%Loc%
send,`t%Stat%`t%Stat%`t`t`t
send,^a%Seas%`t^a%Seas%`t
send,`t`t%Genus%`t%Genus%`t
send,%Species%`t%Species%`t
send,%Cultivar%`t%Cultivar%
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%PrintButton.png
cX +=10
SendEvent {Click, %cX% %cY%}
sleep, %Seconds% ; 
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
SendEvent {Click, %cX% %cY%}
send,{Enter}
LastFunction = (Alt-L) Quick Fill & Print Location
Goto, UpdateLastFn
return	

!7::
Goto, ChangeCalcARD
return


ChangeCalcARD:
InputBox, NoSellCalc, Percentage Calc, Current Calc: %NonSellCalc% Input Decimal:,
InputBox, ARD, Actual-Ready-Date, Input Actual Ready Date without "/" (example:01012022),
MsgBox, Updated Calculator and Ready Date
nVar++
return

!n::
if(nVar = 0)
{
MsgBox, 4,, Would you like to Change No-Sell Calc: %NoSellCalc% and  Act. Ready Date: %ARD%?                (press Yes or No)
IfMsgBox Yes
Goto, ChangeCalcARD
else
MsgBox, This Was a One Time Message, Use ALT+7 to Modify these values.
nVar++

}

if(nVar = 1)
{
InputBox, OnHand, On-Hand, Input On Hand ,
Raw := OnHand * NoSellCalc ;
InputBox, NonSell, On-Hand, (Change Percent with ALT+7)%NoSellCalc% of OnHand is (%Raw%) Input Non-Sell: ,
send,^a%Loc%`t
send,^a%Stat%
send,^a%Seas%`t
send,^a%Prio%`t
send,^a%OnHand%`t`t`t^a%OnHand%`t^a0`t^a%OnHand%`t`t
send,^a%NonSell%`t`t^a%OnHand%`t`t`t`t`t`t
send,%ARD%`t`t`t`t`t
LastFunction = (Alt-n) Quickfill New Location
Goto, UpdateLastFn
}

return

!t::
CoordMode, Pixel, Screen 
CoordMode, Mouse, Screen
send, ^r
sleep, 50 ;
SendEvent {Click, 674 359 }
sleep, 50 ;                                                   
SendEvent {Click, 877 623 }                                   
send, {Enter}                                                 
sleep, 1300 ;                                                 
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%MasStart.png
cY -= -10 ;                                                   
cX += 50 ;                                                    
SendEvent {Click, %cX% %cY% }                                 
send,`t`t                                                     
send,%Genus%`t%Genus%                                         
send,`t%Species%`t%Species%                                   
send,`t%Cultivar%`t%Cultivar%                                 
															  
send,`t`t`t`t`t`t`t                                           
send,^a%Seas%`t^a%Seas%                                       
LastFunction = (Alt-t) Instant Trifecta	
Goto, UpdateLastFn														  
return	                                                      
															  
^.::                                                           
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Status.png
cY += 20 ;                                                    
cX += 175 ;                                                   
SendEvent {Click, %cX% %cY% }                                 
send, ^a%Stat%%Stat%%Loc%`t%Loc%`t  

LastFunction = (.) Quickfill Status & Location
Goto, UpdateLastFn
						  
return                                                        
															  
^/::                                                           
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Genus.png
cY += 20 ;                                                    
cX += 175 ;                                                   
SendEvent {Click, %cX% %cY% }                                 
send, ^a%Genus%`t^a%Genus%`t                                  
send, ^a%Species%`t^a%Species%`t                              
send, ^a%Cultivar%`t^a%Cultivar%`t                            
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Season.png
cY += 20 ;                                                    
cX += 175 ;                                                   
sleep, 200 ;                                                  
SendEvent {Click, %cX% %cY% }                                 
send,^a%Seas%`t                                               
LastFunction = (/) Quick Fill Genus, Species, Cultivar, Season
Goto, UpdateLastFn

return                                                        
															  
															  
!,::                                                          
CoordMode, Pixel, Screen                                      
CoordMode, Mouse, Screen                                      
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%iPrint.png
cY += 20 ;                                                    
cX += 50 ;                                                    
SendEvent {Click, %cX% %cY% }                                 
sleep, 1000 ;                                                 
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
SendEvent {Click, %cX% %cY%}                                  
send,{Enter}                                                  
sleep, 100 ;                                                  
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Apply.png
cY += 20 ;
cX += 75 ;
Sleep, 200 ;
SendEvent {Click, %cX% %cY% }
Send,{Enter} {Enter}
LastFunction = (Alt-,) Auto Print Adjustments and Apply
Goto, UpdateLastFn
return





!y::
FileRead, Text, Genus.txt
Loop, Parse, Text, `n, `r
    MaxNum := A_Index
NumVal =1 
ActPrint =0
DupesFound =0
lCult = none
MsgBox, Number of Items Detected %MaxNum%  (Select Cancel if this is Incorrect)
Goto, AutoTrifecta


return

AutoTrifecta:
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
sleep, 2000 ;
if (NumVal > MaxNum) 
	{
	LastFunction = (Alt-Y) Auto Print Trifectas
	MsgBox, # Print Requested:%MaxNum%     Actual # Printed: %ActPrint%
	if(DupesFound > 0)
		{
		MsgBox, Found and skipped %DupesFound% Duplicates
		}
	if(DupesFound = 0)
		{
		MsgBox, No Duplicates found
		}
Goto, FinishedBalances
	}

if (NumVal <= MaxNum) 
{

FileReadLine, pGenus, Genus.txt, %NumVal%
FileReadLine, pSpecies, Species.txt, %NumVal%
FileReadLine, pCultivar, Cultivar.txt, %NumVal%
	
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%TriStart.png
if(cX = 0)
{
IniWrite, %pGenus% %pSpecies% %pCultivar%, %A_WorkingDir%\MissedTrifectas.txt,%CurrentDateTime%, User: %A_Username% -- %pGenus% %pSpecies% %pCultivar%
}
cY += 15 ;
cX += 55 ;
SendEvent {Click, %cX% %cY% }
Send,^a%pGenus%`t^a%pGenus%`t
Send,^a%pSpecies%`t^a%pSpecies%`t
Send,^a%pCultivar%`t^a%pCultivar%`t
send,{Enter}
Sleep, %Seconds% ; 
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
if(cX > 0)
	{
	ActPrint++
	}
if(cX = 0)
	{
	IniWrite, %pGenus% %pSpecies% %pCultivar%, %A_WorkingDir%\MissedTrifectas.txt,%CurrentDateTime%, User: %A_Username% -- %pGenus% %pSpecies% %pCultivar%
	}

SendEvent {Click, %cX% %cY%}
Send,{Enter}
sleep, 1500 ;
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Ok.png
if(cX > 0)
	{
	SendEvent {Enter}
	}
sleep, 500 ;
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Ok.png
if(cX > 0)
	{
	SendEvent {Enter}
	}
sleep, 500 ;
ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Ok.png
if(cX > 0)
	{
	SendEvent {Enter}
	}
sleep, 200 ;
NumVal++
if(%NumVal% < %MaxNum%)
	{
	MsgBox,,, Starting # %NumVal% / %MaxNum%,1
	}
Goto, AutoTrifecta
}
return



FinishedBalances:
MsgBox, Auto Command Finished Successfully, Thank you for your Patience
Goto, UpdateLastFn
return





!b::
InputBox, PictureDirectory, Picture Directory, Where would you like to save Output?: ,
OrderNumDirectory :=PictureDirectory
OrderNumVal =1
FileRead, Text, %OrderNumDirectory%\OrderNums.txt
Loop, Parse, Text, `n, `r
    MaxOrderNumVal := A_Index
MsgBox, %MaxOrderNumVal%
Goto, PullAndSaveOrderDetail
return


PullAndSaveOrderDetail:
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
if (OrderNumVal > MaxOrderNumVal) 
{
Goto, FinishedBalances
}

if (OrderNumVal <= MaxOrderNumVal) 
{
	FileReadLine, OrderNum, %OrderNumDirectory%\OrderNums.txt, %OrderNumVal%
	Sleep, 2000 ;
	ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%OrderNumber.png
	cY += 45 ;
	cX += 125 ;
	Sleep, 500 ;
	SendEvent {Click, %cX% %cY% }
	Send,^a%OrderNum%`t^a%OrderNum%`t
	ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%OmitPosted.png
	cY += 20 ;
	cX += 25 ;
	Sleep, 200 ;
	SendEvent {Click, %cX% %cY% }
	ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%FindNow.png
	cY += 20 ;
	cX += 25 ;
	Sleep, 500 ;
	SendEvent {Click, %cX% %cY% }
	ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Detail.png
	cY += 20 ;
	cX += 20 ;
	Sleep, 200 ;
	SendEvent {Click, %cX% %cY% }
	Sleep, 500 ;
	SendInput, {PrintScreen}
	Sleep, 200 ;
	run, MSPaint.exe
	WinWait, Untitled - Paint
	WinMaximize
	SendInput, {ctrl down}v{ctrl up}
	SendInput, {ctrl down}s{ctrl up}
	WinWait, Save As	
	Sleep,500 ;
	Send,%OrderNum%
	Sleep, 500 ;
	Send,`t`t`t`t`t{Enter}
	Sleep, 200 ;
	Send,^a%PictureDirectory%{Enter}
	Send,`t`t`t`t`t`t`t`t{Enter}{Left}{Enter}
	sleep, 500 ;
	WinClose, A
	Sleep, 200 ;
	Send, {Enter}
	Sleep, 500 ;
	ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%List.png
	cY += 20 ;
	cX += 20 ;
	Sleep, 200 ;
	SendEvent {Click, %cX% %cY% }
	OrderNumVal++
	Sleep, 200 ;
	
    Goto, PullandSaveOrderDetail
	
	
}

return



!x::

IniRead, G1, %MultiFile%, Genus, G1
IniRead, G2, %MultiFile%, Genus, G2
IniRead, G3, %MultiFile%, Genus, G3
IniRead, G4, %MultiFile%, Genus, G4
IniRead, G5, %MultiFile%, Genus, G5

IniRead, S1, %MultiFile%, Species, S1
IniRead, S2, %MultiFile%, Species, S2
IniRead, S3, %MultiFile%, Species, S3
IniRead, S4, %MultiFile%, Species, S4
IniRead, S5, %MultiFile%, Species, S5

IniRead, C1, %MultiFile%, Cultivar, C1
IniRead, C2, %MultiFile%, Cultivar, C2
IniRead, C3, %MultiFile%, Cultivar, C3
IniRead, C4, %MultiFile%, Cultivar, C4
IniRead, C5, %MultiFile%, Cultivar, C5


MulTick = 1

	if MulTick = 1 
	{
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%LocStart.png

		cX += 20
		SendEvent {Click, %cX% %cY%}
		send,`t^a%Loc%`t^a%Loc%
		send,`t%Stat%`t%Stat%`t`t`t
		send,^a%Seas%`t^a%Seas%`t
		send,`t`t%G1%`t%G1%`t
		send,%S1%`t%S1%`t
		send,%C1%`t%C1%
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%PrintButton.png
		cX +=10
		SendEvent {Click, %cX% %cY%}
		sleep, %Seconds% ; 
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
		SendEvent {Click, %cX% %cY%}
		send,{Enter}
		sleep, 1000 ; 
		MulTick++
	}
	if MulTick = 2 
	{
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%LocStart.png

		cX += 20
		SendEvent {Click, %cX% %cY%}
		send,`t^a%Loc%`t^a%Loc%
		send,`t%Stat%`t%Stat%`t`t`t
		send,^a%Seas%`t^a%Seas%`t
		send,`t`t%G2%`t%G2%`t
		send,%S2%`t%S2%`t
		send,%C2%`t%C2%
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%PrintButton.png
		cX +=10
		SendEvent {Click, %cX% %cY%}
		sleep, %Seconds% ; 
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
		SendEvent {Click, %cX% %cY%}
		send,{Enter}
		sleep, 1000 ; 
		MulTick++
	}
	if MulTick = 3 
	{
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%LocStart.png

		cX += 20
		SendEvent {Click, %cX% %cY%}
		send,`t^a%Loc%`t^a%Loc%
		send,`t%Stat%`t%Stat%`t`t`t
		send,^a%Seas%`t^a%Seas%`t
		send,`t`t%G3%`t%G3%`t
		send,%S3%`t%S3%`t
		send,%C3%`t%C3%
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%PrintButton.png
		cX +=10
		SendEvent {Click, %cX% %cY%}
		sleep, %Seconds% ; 
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
		SendEvent {Click, %cX% %cY%}
		send,{Enter}
		sleep, 1000 ; 
		MulTick++
	}
	if MulTick = 4 
	{
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%LocStart.png

		cX += 20
		SendEvent {Click, %cX% %cY%}
		send,`t^a%Loc%`t^a%Loc%
		send,`t%Stat%`t%Stat%`t`t`t
		send,^a%Seas%`t^a%Seas%`t
		send,`t`t%G4%`t%G4%`t
		send,%S4%`t%S4%`t
		send,%C4%`t%C4%
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%PrintButton.png
		cX +=10
		SendEvent {Click, %cX% %cY%}
		sleep, %Seconds% ; 
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
		SendEvent {Click, %cX% %cY%}
		send,{Enter}
		sleep, 1000 ; 
		MulTick++
	}
	if MulTick = 5 
	{
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%LocStart.png

		cX += 20
		SendEvent {Click, %cX% %cY%}
		send,`t^a%Loc%`t^a%Loc%
		send,`t%Stat%`t%Stat%`t`t`t
		send,^a%Seas%`t^a%Seas%`t
		send,`t`t%G5%`t%G5%`t
		send,%S5%`t%S5%`t
		send,%C5%`t%C5%
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%PrintButton.png
		cX +=10
		SendEvent {Click, %cX% %cY%}
		sleep, %Seconds% ; 
		ImageSearch, cX, cY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %Targets%Print.png
		SendEvent {Click, %cX% %cY%}
		send,{Enter}
		sleep, 1000 ; 
		MulTick++
	}
	if MulTick = 6 
	{
		MulTick = 1
		LastFunction = (Alt-X) Multi Defined Location Print
		Goto, UpdateLastFn
		
		return
	}
	
return

	

















