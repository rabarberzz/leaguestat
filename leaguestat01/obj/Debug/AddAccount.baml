   M S B A M L   `   `   `  ????G  Cleaguestat01, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:leaguestat01leaguestat01  5   	       leaguestat01.AddAccount   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   ,localclr-namespace:leaguestat01     5   	     ? Title$  
AddAccount??5   	   $	??200??6   $	??350??6)   .??5	      ?  ? ColumnDefinitions 5
   
   ?? 5      $
??0.1* ?6   6.   ?? 5      $??* ?6   6+   ?? 5      $
??0.1* ?6   6.    ? RowDefinitions 5   
   ?? 5      $
??0.1* ?6   6,   ?? 5      $
??0.1* ?6   6,   ?? 5      $
??0.2* ?6   6,   ?? 5      $
??0.2* ?6   6,   ?? 5      $
??0.1* ?6   6,   .+?5   
   ?? $??1??6   $??1??6   $??Center=?6-   .??6J   Enter account name6^   ?? 5   
   -   5        $??AccountNameTextbox??5      $??2??6,   $??1??69   6K   ]? 5   
   $??1??6   $??3??6$   $??30??61   ??.  $??Center=?6S   .+?5      ?? -   5        $??	AcceptBtn??5      $??	10 0 10 0q?6A   $??60??6T   .??6_   Accept6g   ?? 5      -   5        $??	CancelBtn??5       ?? IsCancel . $??60??66   .??6A   Cancel6I   ?? 5      -   5        $??
RegionCBox??5      $??60??6*   $??10 0 0 0q?65   6I   5      5      5      