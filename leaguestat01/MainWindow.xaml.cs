using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using Camille;
using Camille.Enums;
using Camille.RiotGames;
using Camille.RiotGames.LeagueV4;
using Camille.RiotGames.MatchV5;
using Camille.RiotGames.SummonerV4;
using Camille.RiotGames.Util;
using Match = Camille.RiotGames.MatchV5.Match;

namespace leaguestat01
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public static string RApiKey = "RGAPI-0cdc9832-b162-42b3-9b43-93fa31f19468";

        public class PlayerAccount
        {
            public Summoner Account_summoner { get; set; }
            public string Account_name { get; set; }
            public int Account_wins { get; set; }
            public int Account_losses { get; set; }
            public double Win_rate { get; set; }
            public double KDA { get; set; }

            public string MostPlayedChamp { get; set; }
            public string MostPlayedPosition { get; set; }
            public PlatformRoute Account_region { get; set; }

            public List<Match> Player_matches = new List<Match>();

            public Dictionary<Match, Participant> MatchWithParticipant = new Dictionary<Match, Participant>();

            public List<MHDisplayInfo> MHDisplayList = new List<MHDisplayInfo>();


            public void GetMostStats() //most stat filler for main account stat tab
            {
                Dictionary<string, int> ChampDict = new Dictionary<string, int>();
                Dictionary<string, int> PositionDict = new Dictionary<string, int>();
                foreach (KeyValuePair<Match, Participant> keyValuePair in MatchWithParticipant)
                {
                    if (ChampDict.ContainsKey(keyValuePair.Value.ChampionName) != true)
                    {
                        ChampDict.Add(keyValuePair.Value.ChampionName, 1);

                    }
                    else
                    {
                        ChampDict[keyValuePair.Value.ChampionName] += 1;
                    }

                    if (PositionDict.ContainsKey(keyValuePair.Value.TeamPosition) != true)
                    {
                        PositionDict.Add(keyValuePair.Value.TeamPosition, 1);
                    }
                    else
                    {
                        PositionDict[keyValuePair.Value.TeamPosition] += 1;
                    }
                }

                MostPlayedChamp = ChampDict.FirstOrDefault(x => x.Value == ChampDict.Values.Max()).Key;
                MostPlayedPosition = PositionDict.FirstOrDefault(x => x.Value == PositionDict.Values.Max()).Key;
            }

            public class MHDisplayInfo // match history display class
            {
                public DateTime GameCreated { get; set; }
                public TimeSpan GameLenght { get; set; }
                public int MatchKills { get; set; }
                public int MatchAssists { get; set; }
                public int MatchDeaths { get; set; }
                public double MatchKDA { get; set; }
                public string MatchChampionName { get; set; }
                public int MatchGoldEarned { get; set; }
                public int MatchDamageDealt { get; set; }
                public bool MatchWon { get; set; }

                public Match MatchUnit { get; set; }

                public MHDisplayInfo(KeyValuePair<Match, Participant> keyValuePair)
                {
                    MatchUnit = keyValuePair.Key;
                    var GameCreatedOffset = DateTimeOffset.FromUnixTimeMilliseconds(keyValuePair.Key.Info.GameCreation);
                    GameCreated = GameCreatedOffset.DateTime;
                    var GameLenghtOffset = DateTimeOffset.FromUnixTimeSeconds(keyValuePair.Key.Info.GameDuration);
                    GameLenght = GameLenghtOffset.TimeOfDay;
                    MatchChampionName = keyValuePair.Value.ChampionName;
                    MatchGoldEarned = keyValuePair.Value.GoldEarned;
                    MatchKills = keyValuePair.Value.Kills;
                    MatchAssists = keyValuePair.Value.Assists;
                    MatchDeaths = keyValuePair.Value.Deaths;
                    MatchDamageDealt = keyValuePair.Value.TotalDamageDealt;
                    double tempkda = (double)(MatchKills + MatchAssists) / Math.Max(1, MatchDeaths);
                    MatchKDA = Math.Round(tempkda,2);
                    MatchWon = keyValuePair.Value.Win;
                }
            }


            public void PopulateMHDisplayList() //Match history list populator
            {
                foreach (KeyValuePair<Match, Participant> pair in MatchWithParticipant)
                {
                    MHDisplayList.Add(new MHDisplayInfo(pair));
                }
            }


            public PlayerAccount(Summoner accountSummoner, PlatformRoute region) // playeraccount constructor with init functions
            {
                Account_summoner = accountSummoner;
                Account_region = region;
                Thread tr1 = new Thread(Fill_matches);
                Thread tr2 = new Thread(GetSetKDA);
                Thread tr3 = new Thread(o => Fill_data((RiotGamesApi)o));
                tr3.Start(riotApi1);
                tr3.Join();
                tr1.Start();
                tr1.Join();
                tr2.Start();
                tr2.Join();
                /*Fill_matches();
                GetSetKDA();*/
                PopulateMHDisplayList();
                GetMostStats();
            }

            

            private void GetSetKDA() //gets kda ratio from matches
            {
                int kills = 0;
                int assists = 0;
                int deaths = 0;
                foreach (Match playerMatch in Player_matches)
                {
                    foreach (Participant infoParticipant in playerMatch.Info.Participants)
                    {
                        if (infoParticipant.Puuid == Account_summoner.Puuid)
                        {
                            kills += infoParticipant.Kills;
                            assists += infoParticipant.Assists;
                            deaths += infoParticipant.Deaths;
                            MatchWithParticipant.Add(playerMatch, infoParticipant);
                        }
                    }
                }

                double finalKda = (double)(kills + assists) / Math.Max(1, deaths);
                finalKda = Math.Round(finalKda, 2);
                KDA = finalKda;
            }



            public void Fill_matches() //fills match history 
            {
                string puiid = Account_summoner.Puuid;
                var matches = riotApi1.MatchV5().GetMatchIdsByPUUID(pickRegionalRoute(), puiid, 20,
                    queue: Queue.SUMMONERS_RIFT_5V5_RANKED_SOLO);
                foreach (string match in matches)
                {
                    var playermatch = riotApi1.MatchV5().GetMatch(pickRegionalRoute(), match);
                    Player_matches.Add(playermatch);
                }
            }

            private RegionalRoute pickRegionalRoute() // regional route picker from platform route
            {
                switch (Account_region)
                {
                    case PlatformRoute.RU:
                    case PlatformRoute.EUN1:
                    case PlatformRoute.EUW1:
                    case PlatformRoute.TR1:
                        return RegionalRoute.EUROPE;
                    case PlatformRoute.NA1:
                    case PlatformRoute.BR1:
                    case PlatformRoute.LA1:
                    case PlatformRoute.LA2:
                    case PlatformRoute.OC1:
                        return RegionalRoute.AMERICAS;
                    case PlatformRoute.KR:
                    case PlatformRoute.JP1:
                        return RegionalRoute.ASIA;
                }

                return RegionalRoute.SEA;
            }

            private void Fill_data(RiotGamesApi api) //fill info about account function
            {
                Account_name = Account_summoner.Name;
                var entriesforSummoner =
                    api.LeagueV4().GetLeagueEntriesForSummoner(Account_region, Account_summoner.Id);
                LeagueEntry accEntry = entriesforSummoner[0];
                Account_wins = accEntry.Wins;
                Account_losses = accEntry.Losses;
                var winrateTemp = (double)Account_wins / (accEntry.Wins + accEntry.Losses) * 100;
                Win_rate = Math.Round(winrateTemp, 2);
            }
        }




        public BindingList<PlayerAccount> PlayerAccounts = new BindingList<PlayerAccount>();
        public static RiotGamesApi riotApi1 = RiotGamesApi.NewInstance(RApiKey);
        public PlayerAccount ActiveAccount;
        GridViewColumnHeader _lastHeaderClicked = null;
        ListSortDirection _lastDirection = ListSortDirection.Ascending;

        public MainWindow()
        {
            InitializeComponent();
            PlayerAccounts.AllowRemove = true;
            AccountListbox.ItemsSource = PlayerAccounts;
            ABQDivisionBox.ItemsSource = Enum.GetValues(typeof(Division));
            ABQTierBox.ItemsSource = Enum.GetValues(typeof(Tier));
            ABQQueueBox.ItemsSource = Enum.GetValues(typeof(QueueType));
            ABQRegionBox.ItemsSource = Enum.GetValues(typeof(PlatformRoute));

            
            AddNewAccount(PlatformRoute.EUW1, "TiltEastWood");
            //AddNewAccount(PlatformRoute.EUW1, "ApologizeLV");

        }

        public void AddNewAccount(PlatformRoute region, string nickname)
        {
            Summoner newSumm = riotApi1.SummonerV4().GetBySummonerName(region, nickname);
            if (newSumm != null)
            {
                PlayerAccount newacc = new PlayerAccount(newSumm, region);
                PlayerAccounts.Add(newacc);
            }
        }


        private void AddAccBtn_OnClick(object sender, RoutedEventArgs e)
        {
            AddAccount addAccount = new AddAccount();
            if (addAccount.ShowDialog() == true)
            {
                AddNewAccount((PlatformRoute)addAccount.RegionCBox.SelectedValue, addAccount.AccountNameResult);
            }
        }

        private void AccountListbox_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (AccountListbox.SelectedItem != null)
            {
                ActiveAccount = (PlayerAccount)AccountListbox.SelectedItem;
                MatchLabelStackPanel.DataContext = ActiveAccount;
                MHListView.ItemsSource = ActiveAccount.MHDisplayList;

            }
            
        }
        
        
        private void RemoveAccBtn_OnClick(object sender, RoutedEventArgs e)
        {
            PlayerAccounts.Remove((PlayerAccount)AccountListbox.SelectedItem);
        }

        //Accounts by queue functions
        private void ABQPageBox_OnPreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex checkNumber = new Regex("[^0-9]+");
            e.Handled = checkNumber.IsMatch(e.Text);
        }

        private void ABQPageBox_OnTextChanged(object sender, TextChangedEventArgs e)
        {
            ABQPageHint.Visibility = Visibility.Visible;
            if (ABQPageBox.Text.Length > 0)
            {
                ABQPageHint.Visibility = Visibility.Hidden;
            }
        }

        private void ABQGoBtn_OnClick(object sender, RoutedEventArgs e) //By match table search button function
        {
            if (ABQPageBox.Text.Length < 1)
            {
                MessageBox.Show("Enter a page number", "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }

            if (ABQDivisionBox.SelectedValue == null || (Division)ABQDivisionBox.SelectedValue == Division.NONE ||
                ABQQueueBox.SelectedValue == null || (QueueType)ABQQueueBox.SelectedValue == QueueType.NONE ||
                (Tier)ABQTierBox.SelectedValue == Tier.NONE || ABQTierBox.SelectedValue == null ||
                ABQRegionBox.SelectedValue == null)
            {
                MessageBox.Show("Don't leave empty inputs", "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                return;
            }

            var QueueEntries = riotApi1.LeagueV4().GetLeagueEntries((PlatformRoute)ABQRegionBox.SelectedValue,
                (QueueType)ABQQueueBox.SelectedValue, (Tier)ABQTierBox.SelectedValue,
                (Division)ABQDivisionBox.SelectedValue, Int32.Parse(ABQPageBox.Text));
            ABQQueueAccountsListBox.ItemsSource = QueueEntries;

        }

        private void ABQAddBtn_OnClick(object sender, RoutedEventArgs e) //By match table add button
        {
            var SelectedEntry = (LeagueEntry)ABQQueueAccountsListBox.SelectedItems[0];
            if (SelectedEntry != null)
            {
                
                PlatformRoute region = (PlatformRoute)ABQRegionBox.SelectedValue;
                string nickname = SelectedEntry.SummonerName;
                AddNewAccount(region, nickname);
            }

        }

        

        private void MHListView_OnClick(object sender, RoutedEventArgs e) //Match history listview column sorting
        {
            var headerClicked = e.OriginalSource as GridViewColumnHeader;
            ListSortDirection direction;

            if (headerClicked != null)
            {
                if (headerClicked.Role != GridViewColumnHeaderRole.Padding)
                {
                    if (headerClicked != _lastHeaderClicked)
                    {
                        direction = ListSortDirection.Ascending;
                    }
                    else
                    {
                        if (_lastDirection == ListSortDirection.Ascending)
                        {
                            direction = ListSortDirection.Descending;
                        }
                        else
                        {
                            direction = ListSortDirection.Ascending;
                        }
                    }

                    var columnBinding = headerClicked.Column.DisplayMemberBinding as Binding;
                    var sortBy = columnBinding?.Path.Path ?? headerClicked.Column.Header as string;

                    Sort(sortBy, direction);

                    if (direction == ListSortDirection.Ascending)
                    {
                        headerClicked.Column.HeaderTemplate =
                            Resources["HeaderTemplateArrowUp"] as DataTemplate;
                    }
                    else
                    {
                        headerClicked.Column.HeaderTemplate =
                            Resources["HeaderTemplateArrowDown"] as DataTemplate;
                    }

                    // Remove arrow from previously sorted header
                    if (_lastHeaderClicked != null && _lastHeaderClicked != headerClicked)
                    {
                        _lastHeaderClicked.Column.HeaderTemplate = null;
                    }

                    _lastHeaderClicked = headerClicked;
                    _lastDirection = direction;
                }
            }
        }
        private void Sort(string sortBy, ListSortDirection direction) //helper for match history listview sorting
        {
            ICollectionView dataView =
                CollectionViewSource.GetDefaultView(MHListView.ItemsSource);

            dataView.SortDescriptions.Clear();
            SortDescription sd = new SortDescription(sortBy, direction);
            dataView.SortDescriptions.Add(sd);
            dataView.Refresh();
        }

        public void DetailsButtonBaseOnClick(object sender, RoutedEventArgs e)
        {
            var SelectedMatch = (PlayerAccount.MHDisplayInfo) MHListView.SelectedItem;
            
            MatchDetailsWindow matchDetailsWindow = new MatchDetailsWindow(SelectedMatch.MatchUnit);
            if (matchDetailsWindow.ShowDialog() == true)
            {
                
            }
        }
    }
}