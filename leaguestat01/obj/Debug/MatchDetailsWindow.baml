   M S B A M L   `   `   `  ????G  Cleaguestat01, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:leaguestat01leaguestat01  5   	   L HCamille.RiotGames, Version=3.0.0.0, Culture=neutral, PublicKeyToken=null`Bclr-namespace:Camille.RiotGames.MatchV5;assembly=Camille.RiotGamesCamille.RiotGames.MatchV5 5   	   %    leaguestat01.MatchDetailsWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   ,localclr-namespace:leaguestat01     5   	   VmatchV5Bclr-namespace:Camille.RiotGames.MatchV5;assembly=Camille.RiotGames     5   	     ? Title$  MatchDetailsWindow??5
   	   $	??550??6$   $	??800??61   .??5      ? -   5        $??MDetailsMainGrid??5       ? DataContext 6#   ?? *MatchGlobal+ ? ColumnDefinitions 5   
   ?? 5      $
??10px ?6   6.   ?? 5      $
??0.2* ?6   6.   ?? 5      $
??20px ?6   6.   ?? 5      $??* ?6   6+    ? RowDefinitions 5   
   ?? 5      $
??10px ?6   6,   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      6   ?? 5      $
??10px ?6   6,   .+?5#   
   ?? -   5        $??ParticipantListBox??5#      $??1??6,   $??5??69   $??1??6J   ??5$      ?? 5%       ?? DataType$ matchV5:Participant??6   .R?5&      ?? ??6   ??  ?? Path$ SummonerName?5'      5)      ?? 5+   
   -   5        $??CompareListbox??5+      $??6??6(   $??5??65   $??1??6F   $
??0 10q?6V   ??5,      ?? 5-      $ matchV5:Participant??6   .R?5.      ?? ??6   ?? $ SummonerName?5/      51      ?? 53   
   -   5        $??MainTabControl??53   D   $??1??6   $??3??6"   $??10??62   .@?54      ?? $??Match??6   .??55      ? -   5        $??	MatchGrid??55       56      ?? 57      $
??0.4* ?6+   6:   ?? 58      $
??0.3* ?6+   6:   ?? 59      $
??0.3* ?6+   6:   .+?5;      ?? $??0??6!   $??Center=?61   $
??10 0q?6N   .+?5<      ?? $
??30px??6    .??6.   Ranked games6<   ?? 5=      $
??30px??6    .??6.   	Kills :67   ?? 5>      $
??30px??6    .??6.   	Assists :69   ?? 5?      $
??30px??6    .??6.   
Deaths :68   ?? 5@      $
??30px??6    .??6.   KDA :65   ?? 5A      $
??30px??6    .??6.   
Champion :6:   ?? 5B      $
??30px??6    .??6.   
Position :6:   ?? 5C      $
??30px??6    .??6.   Champion level :6@   ?? 5D      $
??30px??6    .??6.   Gold earned :6=   ?? 5E      $
??30px??6    .??6.   Damage dealt :6>   ?? 5F      $
??30px??6    .??6.   Role :66   ?? 5G      $
??30px??6    .??6.   Wards placed :6>   ?? 5H      $
??30px??6    .??6.   
Team won :6:   5I      ?? 5J      -   5        $??MatchTabStackPanel??5J   2   $??1??6"   $
??Left=?6L   .+?5K      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5L      $
??30px??6    ??6.   ?? *Kills+6J   ?? 5M      $
??30px??6    ??6.   ?? *	Assists+6L   ?? 5N      $
??30px??6!   ??6/   ?? $ Deaths?6T   ?? 5O      -   5        $??ParticipantKDA??5O       $
??30px??66   6G   ?? 5P      $
??30px??6    ??6.   ?? *ChampionName+6Q   ?? 5Q      $
??30px??6    ??6.   ?? *TeamPosition+6Q   ?? 5R      $
??30px??6    ??6.   ?? *
ChampLevel+6O   ?? 5S      $
??30px??6    ??6.   ?? *
GoldEarned+6O   ?? 5T      $
??30px??6    ??6.   ?? *TotalDamageDealt+6U   ?? 5U      $
??30px??6    ??6.   ?? *Role+6I   ?? 5V      $
??30px??6    ??6.   ?? *WardsPlaced+6P   ?? 5W      $
??30px??6    ??6.   ?? *Win+6H   5X      ?? 5Y      -   5        $??MatchTabStackPanelCompare??5Y   2   $??2??6"   $
??Left=?6T   .+?5Z      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5[      $
??30px??6    ??6.   ?? *Kills+6J   ?? 5\      $
??30px??6    ??6.   ?? *	Assists+6L   ?? 5]      $
??30px??6!   ??6/   ?? $ Deaths?6T   ?? 5^      -	   5        $??ParticipantKDACompare??5^       $
??30px??6=   6N   ?? 5_      $
??30px??6    ??6.   ?? *ChampionName+6Q   ?? 5`      $
??30px??6    ??6.   ?? *TeamPosition+6Q   ?? 5a      $
??30px??6    ??6.   ?? *
ChampLevel+6O   ?? 5b      $
??30px??6    ??6.   ?? *
GoldEarned+6O   ?? 5c      $
??30px??6    ??6.   ?? *TotalDamageDealt+6U   ?? 5d      $
??30px??6    ??6.   ?? *Role+6I   ?? 5e      $
??30px??6    ??6.   ?? *WardsPlaced+6P   ?? 5f      $
??30px??6    ??6.   ?? *Win+6H   5g      5h      5i      ?? 5j      $??Damage??6   .??5k      ? -
   5        $??
DamageGrid??5k       5l      ?? 5m      $??* ?6+   67   ?? 5n      $??* ?6+   67   ?? 5o      $??* ?6+   67   .+?5q      ?? $??0??6!   $??Right=?61   $
??10 0q?6N   .+?5r      ?? $
??30px??6    .??6/   Ranked games6=   ?? 5s      $
??30px??6    .??6.   Total damage dealt :6D   ?? 5t      $
??30px??6    .??6.   #!Total damage dealt to champions :6Q   ?? 5u      $
??30px??6    .??6.   Total damage taken :6D   ?? 5v      $
??30px??6    .??6.   Physical damage dealt :6G   ?? 5w      $
??30px??6    .??6.   &$Physical damage dealt to champions :6T   ?? 5x      $
??30px??6    .??6.   Physical damage taken :6G   ?? 5y      $
??30px??6    .??6.   Magic damage dealt :6D   ?? 5z      $
??30px??6    .??6.   #!Magic damage dealt to champions :6Q   ?? 5{      $
??30px??6    .??6.   Magic damage taken :6D   ?? 5|      $
??30px??6    .??6.   True damage dealt :6C   ?? 5}      $
??30px??6    .??6.   " True damage dealt to champions :6P   ?? 5~      $
??30px??6    .??6.   True damage taken :6C   5      ?? 5?      -   5        $??DamageTabStackPanel??5?   2   $??1??6"   .+?5?      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5?      $
??30px??6    ??6.   ?? *TotalDamageDealt+6U   ?? 5?      $
??30px??6    ??6.   ?? *TotalDamageDealtToChampions+6`   ?? 5?      $
??30px??6    ??6.   ?? *TotalDamageTaken+6V   ?? 5?      $
??30px??6    ??6.   ?? *PhysicalDamageDealt+6Y   ?? 5?      $
??30px??6    ??6.   ?? * PhysicalDamageDealtToChampions+6c   ?? 5?      $
??30px??6    ??6.   ?? *PhysicalDamageTaken+6X   ?? 5?      $
??30px??6    ??6.   ?? *MagicDamageDealt+6U   ?? 5?      $
??30px??6    ??6.   ?? *MagicDamageDealtToChampions+6`   ?? 5?      $
??30px??6    ??6.   ?? *MagicDamageTaken+6U   ?? 5?      $
??30px??6    ??6.   ?? *TrueDamageDealt+6T   ?? 5?      $
??30px??6    ??6.   ?? *TrueDamageDealtToChampions+6_   ?? 5?      $
??30px??6    ??6.   ?? *TrueDamageTaken+6T   5?      ?? 5?      -   5        $ ??DamageTabStackPanelCompare??5?   2   $??2??6"   .+?5?      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5?      $
??30px??6    ??6.   ?? *TotalDamageDealt+6U   ?? 5?      $
??30px??6    ??6.   ?? *TotalDamageDealtToChampions+6`   ?? 5?      $
??30px??6    ??6.   ?? *TotalDamageTaken+6V   ?? 5?      $
??30px??6    ??6.   ?? *PhysicalDamageDealt+6Y   ?? 5?      $
??30px??6    ??6.   ?? * PhysicalDamageDealtToChampions+6c   ?? 5?      $
??30px??6    ??6.   ?? *PhysicalDamageTaken+6X   ?? 5?      $
??30px??6    ??6.   ?? *MagicDamageDealt+6U   ?? 5?      $
??30px??6    ??6.   ?? *MagicDamageDealtToChampions+6`   ?? 5?      $
??30px??6    ??6.   ?? *MagicDamageTaken+6U   ?? 5?      $
??30px??6    ??6.   ?? *TrueDamageDealt+6T   ?? 5?      $
??30px??6    ??6.   ?? *TrueDamageDealtToChampions+6_   ?? 5?      $
??30px??6    ??6.   ?? *TrueDamageTaken+6T   5?      5?      5?      ?? 5?      $??Kills??6   .??5?      ? -   5        $??KillGrid??5?       5?      ?? 5?      $
??0.5* ?6+   6:   ?? 5?      $??* ?6+   67   ?? 5?      $??* ?6+   67   .+?5?      ?? $??0??6!   $??Center=?61   .+?5?      ?? $
??30px??6    .??6.   Ranked games6<   ?? 5?      $
??30px??6    .??6.   	Kills :67   ?? 5?      $
??30px??6    .??6.   Double kills :6>   ?? 5?      $
??30px??6    .??6.   Triple kills :6>   ?? 5?      $
??30px??6    .??6.   Quadra kills :6>   ?? 5?      $
??30px??6    .??6.   Penta kills :6=   ?? 5?      $
??30px??6    .??6.   First blood kill :6B   ?? 5?      $
??30px??6    .??6.   Largest killing spree :6G   ?? 5?      $
??30px??6    .??6.   Largest multi kill :6D   5?      ?? 5?      -   5        $??KillsTabStackPanel??5?   2   $??1??6"   .+?5?      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5?      $
??30px??6    ??6.   ?? *Kills+6J   ?? 5?      $
??30px??6    ??6.   ?? *DoubleKills+6P   ?? 5?      $
??30px??6    ??6.   ?? *TripleKills+6R   ?? 5?      $
??30px??6    ??6.   ?? *QuadraKills+6Q   ?? 5?      $
??30px??6    ??6.   ?? *
PentaKills+6O   ?? 5?      $
??30px??6    ??6.   ?? *FirstBloodKill+6S   ?? 5?      $
??30px??6    ??6.   ?? *LargestKillingSpree+6X   ?? 5?      $
??30px??6    ??6.   ?? *LargestMultiKill+6U   5?      ?? 5?      -   5        $??KillsTabStackPanelCompare??5?   2   $??2??6"   .+?5?      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5?      $
??30px??6    ??6.   ?? *Kills+6J   ?? 5?      $
??30px??6    ??6.   ?? *DoubleKills+6P   ?? 5?      $
??30px??6    ??6.   ?? *TripleKills+6R   ?? 5?      $
??30px??6    ??6.   ?? *QuadraKills+6Q   ?? 5?      $
??30px??6    ??6.   ?? *
PentaKills+6O   ?? 5?      $
??30px??6    ??6.   ?? *FirstBloodKill+6S   ?? 5?      $
??30px??6    ??6.   ?? *LargestKillingSpree+6X   ?? 5?      $
??30px??6    ??6.   ?? *LargestMultiKill+6U   5?      5?      5?      ?? 5?      $??Items??6   .??5?      ? -   5        $??ItemGrid??5?       5?      ?? 5?      $
??0.5* ?6+   6:   ?? 5?      $??* ?6+   67   ?? 5?      $??* ?6+   67   .+?5?      ?? $??0??6!   $??Center=?61   .+?5?      ?? $
??30px??6    .??6.   Ranked games6<   ?? 5?      $
??30px??6    .??6.   
Item 1 :68   ?? 5?      $
??30px??6    .??6.   
Item 2 :68   ?? 5?      $
??30px??6    .??6.   
Item 3 :68   ?? 5?      $
??30px??6    .??6.   
Item 4 :68   ?? 5?      $
??30px??6    .??6.   
Item 5 :68   ?? 5?      $
??30px??6    .??6.   
Item 6 :68   ?? 5?      $
??30px??6    .??6.   
Item 7 :68   ?? 5?      $
??30px??6    .??6.   Items purchased :6A   ?? 5?      $
??30px??6    .??6.   Consumables purchased :6G   5?      ?? 5?      -   5        $??ItemsTabStackPanel??5?   2   $??1??6"   .+?5?      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5?      $
??30px??6    ??6.   ?? *Item0+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item1+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item2+6K   ?? 5?      $
??30px??6    ??6.   ?? *Item3+6K   ?? 5?      $
??30px??6    ??6.   ?? *Item4+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item5+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item6+6J   ?? 5?      $
??30px??6    ??6.   ?? *ItemsPurchased+6S   ?? 5?      $
??30px??6    ??6.   ?? *ConsumablesPurchased+6Y   5?      ?? 5?      -   5        $??ItemsTabStackPanelCompare??5?   2   $??2??6"   .+?5?      ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5?      $
??30px??6    ??6.   ?? *Item0+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item1+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item2+6K   ?? 5?      $
??30px??6    ??6.   ?? *Item3+6K   ?? 5?      $
??30px??6    ??6.   ?? *Item4+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item5+6J   ?? 5?      $
??30px??6    ??6.   ?? *Item6+6J   ?? 5?      $
??30px??6    ??6.   ?? *ItemsPurchased+6S   ?? 5?      $
??30px??6    ??6.   ?? *ConsumablesPurchased+6Y   5?      5?      5?      ?? 5?      $??Spells??6   .??5?      ? -   5        $??	SpellGrid??5?       5?      ?? 5?      $
??0.5* ?6+   6:   ?? 5?      $??* ?6+   67   ?? 5?      $??* ?6+   67   .+?5?      ?? $??0??6!   $??Center=?61   .+?5      ?? $
??30px??6    .??6.   Ranked games6<   ?? 5     $
??30px??6    .??6.   Spell 1 cast count :6D   ?? 5     $
??30px??6    .??6.   Spell 2 cast count :6D   ?? 5     $
??30px??6    .??6.   Spell 3 cast count :6D   ?? 5     $
??30px??6    .??6.   Spell 4 cast count :6D   ?? 5     $
??30px??6    .??6.   Summoner spell 1 :6B   ?? 5     $
??30px??6    .??6.   Summoner spell 1 cast count :6M   ?? 5     $
??30px??6    .??6.   Summoner spell 2 :6B   ?? 5     $
??30px??6    .??6.   Summoner spell 2 cast count :6M   5	     ?? 5
     -   5        $??SpellTabStackPanel??5
  2   $??1??6"   .+?5     ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5     $
??30px??6    ??6.   ?? *Spell1Casts+6P   ?? 5     $
??30px??6    ??6.   ?? *Spell2Casts+6P   ?? 5     $
??30px??6    ??6.   ?? *Spell3Casts+6Q   ?? 5     $
??30px??6    ??6.   ?? *Spell4Casts+6Q   ?? 5     $
??30px??6    ??6.   ?? *Summoner1Id+6P   ?? 5     $
??30px??6    ??6.   ?? *Summoner1Casts+6S   ?? 5     $
??30px??6    ??6.   ?? *Summoner2Id+6P   ?? 5     $
??30px??6    ??6.   ?? *Summoner2Casts+6S   5     ?? 5     -   5        $??SpellTabStackPanelCompare??5  2   $??2??6"   .+?5     ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5     $
??30px??6    ??6.   ?? *Spell1Casts+6P   ?? 5     $
??30px??6    ??6.   ?? *Spell2Casts+6P   ?? 5     $
??30px??6    ??6.   ?? *Spell3Casts+6Q   ?? 5     $
??30px??6    ??6.   ?? *Spell4Casts+6Q   ?? 5     $
??30px??6    ??6.   ?? *Summoner1Id+6P   ?? 5     $
??30px??6    ??6.   ?? *Summoner1Casts+6S   ?? 5     $
??30px??6    ??6.   ?? *Summoner2Id+6P   ?? 5     $
??30px??6    ??6.   ?? *Summoner2Casts+6S   5     5      5!     ?? 5"     $??
Objectives??6   .??5#     ? -   5        $??ObjectiveGrid??5#      5$     ?? 5%     $
??0.5* ?6+   6:   ?? 5&     $??* ?6+   67   ?? 5'     $??* ?6+   67   .+?5)     ?? $??0??6!   $??Center=?61   .+?5*     ?? $
??30px??6    .??6.   Ranked games6<   ?? 5+     $
??30px??6    .??6.   Baron kills :6=   ?? 5,     $
??30px??6    .??6.   Dragon kills :6>   ?? 5-     $
??30px??6    .??6.   Damage dealt to objectives :6L   ?? 5.     $
??30px??6    .??6.   Damage dealt to turrets :6I   ?? 5/     $
??30px??6    .??6.   Damage dealt to buildings :6K   ?? 50     $
??30px??6    .??6.   Inhibitors destroyed :6F   ?? 51     $
??30px??6    .??6.   Neutral minions killed :6H   ?? 52     $
??30px??6    .??6.   Objectives stolen :6C   ?? 53     $
??30px??6    .??6.   !Time crowd controlling others :6O   ?? 54     $
??30px??6    .??6.   Time spent dead :6A   ?? 55     $
??30px??6    .??6.   Turrets taken down :6D   56     ?? 57     -   5        $??ObjectivesTabStackPanel??57  2   $??1??6"   .+?58     ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 59     $
??30px??6    ??6.   ?? *
BaronKills+6O   ?? 5:     $
??30px??6    ??6.   ?? *DragonKills+6P   ?? 5;     $
??30px??6    ??6.   ?? *DamageDealtToObjectives+6^   ?? 5<     $
??30px??6    ??6.   ?? *DamageDealtToTurrets+6Z   ?? 5=     $
??30px??6    ??6.   ?? *DamageDealtToBuildings+6[   ?? 5>     $
??30px??6    ??6.   ?? *InhibitorKills+6S   ?? 5?     $
??30px??6    ??6.   ?? *NeutralMinionsKilled+6Y   ?? 5@     $
??30px??6    ??6.   ?? *ObjectivesStolen+6U   ?? 5A     -   5        $!??ParticipantTotalTimeCCDealt??5A  .   $
??30px??6    6T   ?? 5B     -   5        $#??ParticipantTotalTimeSpentDead??5B  .   $
??30px??6    6W   ?? 5C     $
??30px??6    ??6.   ?? *TurretTakedowns+6T   5D     ?? 5E     -   5        $$??ObjectivesTabStackPanelCompare??5E  2   $??2??6"   .+?5F     ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5G     $
??30px??6    ??6.   ?? *
BaronKills+6O   ?? 5H     $
??30px??6    ??6.   ?? *DragonKills+6P   ?? 5I     $
??30px??6    ??6.   ?? *DamageDealtToObjectives+6^   ?? 5J     $
??30px??6    ??6.   ?? *DamageDealtToTurrets+6Z   ?? 5K     $
??30px??6    ??6.   ?? *DamageDealtToBuildings+6[   ?? 5L     $
??30px??6    ??6.   ?? *InhibitorKills+6S   ?? 5M     $
??30px??6    ??6.   ?? *NeutralMinionsKilled+6Y   ?? 5N     $
??30px??6    ??6.   ?? *ObjectivesStolen+6U   ?? 5O     -   5        $(??"ParticipantTotalTimeCCDealtCompare??5O  .   $
??30px??6    6[   ?? 5P     -   5        $*??$ParticipantTotalTimeSpentDeadCompare??5P  .   $
??30px??6    6^   ?? 5Q     $
??30px??6    ??6.   ?? *TurretTakedowns+6T   5R     5S     5T     ?? 5U     $
??Misc??6   .??5V     ? -   5        $??MiscGrid??5V      5W     ?? 5X     $
??0.5* ?6+   6:   ?? 5Y     $??* ?6+   67   ?? 5Z     $??* ?6+   67   .+?5\     ?? $??0??6!   $??Center=?61   .+?5]     ?? $
??30px??6    .??6.   Ranked games6<   ?? 5^     $
??30px??6    .??6.   Wards killed :6>   ?? 5_     $
??30px??6    .??6.   Wards placed :6>   ?? 5`     $
??30px??6    .??6.   Detector wards placed :6G   ?? 5a     $
??30px??6    .??6.   Vision score :6>   ?? 5b     $
??30px??6    .??6.   Sight wards bought :6D   ?? 5c     $
??30px??6    .??6.   Vision wards bought :6E   ?? 5d     $
??30px??6    .??6.   Lane played :6=   ?? 5e     $
??30px??6    .??6.   Gold earned :6=   ?? 5f     $
??30px??6    .??6.   Gold spent :6<   ?? 5g     $
??30px??6    .??6.   Longest time alive :6D   ?? 5h     $
??30px??6    .??6.   Largest critical strike :6I   5i     ?? 5j     -   5        $??MiscTabStackPanel??5j  2   $??1??6"   .+?5k     ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5l     $
??30px??6    ??6.   ?? *WardsKilled+6P   ?? 5m     $
??30px??6    ??6.   ?? *WardsPlaced+6P   ?? 5n     $
??30px??6    ??6.   ?? *DetectorWardsPlaced+6X   ?? 5o     $
??30px??6    ??6.   ?? *VisionScore+6Q   ?? 5p     $
??30px??6    ??6.   ?? *SightWardsBoughtInGame+6[   ?? 5q     $
??30px??6    ??6.   ?? *VisionWardsBoughtInGame+6\   ?? 5r     $
??30px??6    ??6.   ?? *Lane+6I   ?? 5s     $
??30px??6    ??6.   ?? *
GoldEarned+6O   ?? 5t     $
??30px??6    ??6.   ?? *	GoldSpent+6N   ?? 5u     -   5        $ ??ParticipantTimeSpentLiving??5u      $
??30px??6B   6S   ?? 5v     $
??30px??6    ??6.   ?? *LargestCriticalStrike+6Z   5w     ?? 5x     -    5        $??MiscTabStackPanelCompare??5x  2   $??2??6"   .+?5y     ?? $
??30px??6    ??6.   ?? *SummonerName+6Q   ?? 5z     $
??30px??6    ??6.   ?? *WardsKilled+6P   ?? 5{     $
??30px??6    ??6.   ?? *WardsPlaced+6P   ?? 5|     $
??30px??6    ??6.   ?? *DetectorWardsPlaced+6X   ?? 5}     $
??30px??6    ??6.   ?? *VisionScore+6Q   ?? 5~     $
??30px??6    ??6.   ?? *SightWardsBoughtInGame+6[   ?? 5     $
??30px??6    ??6.   ?? *VisionWardsBoughtInGame+6\   ?? 5?     $
??30px??6    ??6.   ?? *Lane+6I   ?? 5?     $
??30px??6    ??6.   ?? *
GoldEarned+6O   ?? 5?     $
??30px??6    ??6.   ?? *	GoldSpent+6N   ?? 5?     -!   5        $'??!ParticipantTimeSpentLivingCompare??5?      $
??30px??6I   6Z   ?? 5?     $
??30px??6    ??6.   ?? *LargestCriticalStrike+6Z   5?     5?     5?     5?     5?     5?     